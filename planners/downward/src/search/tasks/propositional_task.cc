#include "propositional_task.h"

#include "../utils/logging.h"
#include "../utils/tokenizer.h"

#include <fstream>

using namespace std;


namespace extra_tasks {

static void parse_predicates_file(const std::string& filename, dlplan::core::VocabularyInfo& vocabulary_info) {
    std::ifstream infile(filename);
    if (!infile.is_open()) {
        throw std::runtime_error("parse_predicates_file - predicates.txt does not exist.");
    }
    std::string name;
    int arity;
    while (infile >> name >> arity) {
        vocabulary_info.add_predicate(name, arity);
        vocabulary_info.add_predicate(name + "_g", arity);
    }
}


static void parse_constants_file(const std::string& filename, dlplan::core::VocabularyInfo& vocabulary_info) {
    std::ifstream infile(filename);
    if (!infile.is_open()) {
        throw std::runtime_error("parse_constants_file - constants.txt does not exist.");
    }
    std::string name;
    while (infile >> name) {
        vocabulary_info.add_constant(name);
    }
}


enum class AtomTokenType {
    COMMA,
    OPENING_PARENTHESIS,
    CLOSING_PARENTHESIS,
    NAME
};


static const std::vector<std::pair<AtomTokenType, std::regex>> atom_token_regexes = {
    { AtomTokenType::COMMA, utils::Tokenizer<AtomTokenType>::build_regex(",") },
    { AtomTokenType::OPENING_PARENTHESIS, utils::Tokenizer<AtomTokenType>::build_regex("\\(") },
    { AtomTokenType::CLOSING_PARENTHESIS, utils::Tokenizer<AtomTokenType>::build_regex("\\)") },
    { AtomTokenType::NAME, utils::Tokenizer<AtomTokenType>::build_regex("[a-zA-Z0-9_@\\-]+") },
};


static int parse_atom(const std::string& atom_name, dlplan::core::InstanceInfo& instance_info, bool is_static, bool is_goal) {
    auto tokens = utils::Tokenizer<AtomTokenType>().tokenize(atom_name, atom_token_regexes);
    if (tokens.size() < 3) throw std::runtime_error("parse_atom - insufficient number of tokens: " + std::to_string(tokens.size()));
    if (tokens[0].first != AtomTokenType::NAME) throw std::runtime_error("parse_atom_line - expected predicate name at position 0.");
    if (tokens[1].first != AtomTokenType::OPENING_PARENTHESIS) throw std::runtime_error("parse_atom_line - expected opening parenthesis at position 1.");
    std::string predicate_name = tokens[0].second;
    if (is_goal) {
        predicate_name += "_g";
    }
    if (predicate_name == "dummy") {
        return UNDEFINED;
    } else if (predicate_name.substr(0, 10) == "new-axiom@") {
        return UNDEFINED;
    }
    std::vector<std::string> object_names;
    int i = 2; // position of first object_name
    while (i < static_cast<int>(tokens.size())) {
        if (tokens[i].first == AtomTokenType::CLOSING_PARENTHESIS) {
            break;
        } else if (tokens[i].first == AtomTokenType::COMMA) {
            ++i;
        } else if (tokens[i].first == AtomTokenType::NAME) {
            object_names.push_back(tokens[i].second);
            ++i;
        } else {
            throw std::runtime_error("parse_atom_line - expected comma or name: " + tokens[i].second);
        }
    }
    if (tokens.back().first != AtomTokenType::CLOSING_PARENTHESIS) throw std::runtime_error("parse_atom_line - expected closing parenthesis.");
    const auto& atom = (is_static)
        ? instance_info.add_static_atom(predicate_name, object_names)
        : instance_info.add_atom(predicate_name, object_names);
    return atom.get_index();
}


static void parse_static_atoms_file(const std::string& filename, dlplan::core::InstanceInfo& instance_info) {
    std::ifstream infile(filename);
    if (!infile.is_open()) {
        throw std::runtime_error("parse_static_atoms_file - static_atoms.txt does not exist.");
    }
    std::string name;
    while (infile >> name) {
        parse_atom(name, instance_info, true, false);
    }
}


static void parse_goal_atoms_file(const std::string& filename, dlplan::core::InstanceInfo& instance_info) {
    std::ifstream infile(filename);
    if (!infile.is_open()) {
        throw std::runtime_error("parse_goal_atoms_file - goal_atoms.txt does not exist.");
    }
    std::string name;
    while (infile >> name) {
        parse_atom(name, instance_info, true, true);
    }
}


static const std::vector<std::pair<AtomTokenType, std::regex>> fd_atom_token_regexes = {
    { AtomTokenType::COMMA, utils::Tokenizer<AtomTokenType>::build_regex(",") },
    { AtomTokenType::OPENING_PARENTHESIS, utils::Tokenizer<AtomTokenType>::build_regex("\\(") },
    { AtomTokenType::CLOSING_PARENTHESIS, utils::Tokenizer<AtomTokenType>::build_regex("\\)") },
    { AtomTokenType::NAME, utils::Tokenizer<AtomTokenType>::build_regex("[a-zA-Z0-9_@\\-]+") },
};


FactIndexer::FactIndexer(const TaskProxy &task_proxy) {
    fact_offsets.reserve(task_proxy.get_variables().size());
    num_facts = 0;
    for (VariableProxy var : task_proxy.get_variables()) {
        fact_offsets.push_back(num_facts);
        int domain_size = var.get_domain_size();
        num_facts += domain_size;
    }

    int num_vars = task_proxy.get_variables().size();
    int last_domain_size = task_proxy.get_variables()[num_vars - 1].get_domain_size();
    // We don't need offsets for facts of the last variable.
    int num_pair_offsets = num_facts - last_domain_size;
    pair_offsets.reserve(num_pair_offsets);
    int current_pair_offset = 0;
    int num_facts_in_higher_vars = num_facts;
    num_pairs = 0;
    for (int var_id = 0; var_id < num_vars - 1; ++var_id) {  // Skip last var.
        int domain_size = task_proxy.get_variables()[var_id].get_domain_size();
        int var_last_fact_id = get_fact_id(FactPair(var_id, domain_size - 1));
        num_facts_in_higher_vars -= domain_size;
        num_pairs += (domain_size * num_facts_in_higher_vars);
        for (int value = 0; value < domain_size; ++value) {
            pair_offsets.push_back(current_pair_offset - (var_last_fact_id + 1));
            current_pair_offset += num_facts_in_higher_vars;
        }
    }
    assert(static_cast<int>(pair_offsets.size()) == num_pair_offsets);
    assert(num_facts_in_higher_vars == last_domain_size);
#ifndef NDEBUG
    cout << "Facts: " << num_facts << endl;
    cout << "Pairs: " << num_pairs << endl;
    cout << "Pair offsets: " << pair_offsets << endl;
    int expected_id = 0;
    for (FactProxy fact_proxy1 : task_proxy.get_variables().get_facts()) {
        FactPair fact1 = fact_proxy1.get_pair();
        for (FactProxy fact_proxy2 : task_proxy.get_variables().get_facts()) {
            FactPair fact2 = fact_proxy2.get_pair();
            if (!(fact1 < fact2) || fact1.var == fact2.var) {
                continue;
            }
            int id = get_pair_id(fact1, fact2);
            if (false) {
                cout << "Fact pair " << fact1 << " & " << fact2 << endl;
                cout << "Offset: " << pair_offsets[get_fact_id(fact1)] << endl;
                cout << "ID fact2: " << get_fact_id(fact2) << endl;
                cout << id << endl;
            }
            ++expected_id;
        }
    }
#endif
}


PropositionalTask::PropositionalTask(
    const std::shared_ptr<AbstractTask> &parent,
    const TaskProxy &task_proxy)
    : DelegatingTask(parent),
      m_vocabulary_info(std::make_shared<dlplan::core::VocabularyInfo>()),
      m_policy_builder(dlplan::policy::PolicyBuilder()),
      m_syntactic_element_factory(std::make_shared<dlplan::core::VocabularyInfo>()),
      m_fact_indexer(std::make_shared<FactIndexer>(TaskProxy(*parent))) {
    m_syntactic_element_factory = dlplan::core::SyntacticElementFactory(m_vocabulary_info);
    parse_predicates_file("predicates.txt", *m_vocabulary_info);
    parse_constants_file("constants.txt", *m_vocabulary_info);
    m_instance_info = std::make_shared<dlplan::core::InstanceInfo>(m_vocabulary_info);
    parse_static_atoms_file("static-atoms.txt", *m_instance_info);
    parse_goal_atoms_file("goal-atoms.txt", *m_instance_info);
    std::string atom_prefix = "Atom ";
    for (FactProxy fact_proxy : task_proxy.get_variables().get_facts()) {
        std::string name = fact_proxy.get_name();
        std::cout << name << std::endl;
        if (name.substr(0, 5) == atom_prefix) {
            m_is_negated_facts.push_back(false);
            std::string normalized_name = name.substr(atom_prefix.size());
            fact_index_to_dlplan_atom_index.push_back(
                parse_atom(normalized_name, *m_instance_info, false, false)
            );
        } else {
            m_is_negated_facts.push_back(true);
            fact_index_to_dlplan_atom_index.push_back(UNDEFINED);
        }
    }
    for (size_t index = 0; index < parent->get_num_goals(); ++index) {
        m_goal_fact_ids.insert(m_fact_indexer->get_fact_id(parent->get_goal_fact(index)));
    }
}

dlplan::core::State PropositionalTask::compute_dlplan_state(const State& state) const {
    std::vector<int> atom_indices;
    atom_indices.reserve(m_fact_indexer->get_num_facts());
    for (int fact_id : get_state_fact_ids(state)) {
        int dlplan_atom_index = fact_index_to_dlplan_atom_index[fact_id];
        if (dlplan_atom_index != UNDEFINED) {
            atom_indices.push_back(dlplan_atom_index);
        }
    }
    atom_indices.shrink_to_fit();
    return dlplan::core::State(m_instance_info, atom_indices, state.get_id().value);
}

const std::unordered_set<int>& PropositionalTask::get_goal_fact_ids() const {
    return m_goal_fact_ids;
}

std::vector<int> PropositionalTask::get_state_fact_ids(const State& state) const {
    std::vector<int> fact_ids;
    for (FactProxy fact_proxy : state) {
        FactPair fact = fact_proxy.get_pair();
        fact_ids.push_back(m_fact_indexer->get_fact_id(fact));
    }
    return fact_ids;
}

bool PropositionalTask::is_negated_fact(int fact_id) const {
    return m_is_negated_facts[fact_id];
}

dlplan::policy::PolicyBuilder& PropositionalTask::get_policy_builder() {
    return m_policy_builder;
}

dlplan::core::SyntacticElementFactory& PropositionalTask::get_syntactic_element_factory() {
    return m_syntactic_element_factory;
}

dlplan::core::DenotationsCaches& PropositionalTask::get_denotations_caches() {
    return m_denotations_caches;
}

std::shared_ptr<FactIndexer> PropositionalTask::get_fact_indexer() {
    return m_fact_indexer;
}

}
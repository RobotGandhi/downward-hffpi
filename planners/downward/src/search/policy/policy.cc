#include "policy.h"

#include "../option_parser.h"
#include "../plugin.h"

#include "../task_utils/task_properties.h"
#include "../tasks/root_task.h"

#include <fstream>

using namespace std;


namespace policy {

Policy::Policy(const options::Options &opts)
    : propositional_task(tasks::g_root_task, TaskProxy(*tasks::g_root_task)) {
    string filename(opts.get<std::string>("filename"));
    ifstream infile(filename);
    if (!infile.is_open()) {
        throw std::runtime_error("Policy::Policy - " + filename + " does not exist.");
    }
    stringstream ss;
    ss << infile.rdbuf();
    policy = dlplan::policy::PolicyReader().read(ss.str(), propositional_task.get_policy_builder(), propositional_task.get_syntactic_element_factory());
}

std::vector<std::shared_ptr<const dlplan::policy::Rule>>
Policy::evaluate_conditions_eager(
    const State& state) {
    return policy->evaluate_conditions_eager(
        propositional_task.compute_dlplan_state(state),
        propositional_task.get_denotations_caches());
}

bool
Policy::evaluate_effects_lazy(
    const State& source,
    const State& target,
    const std::vector<std::shared_ptr<const dlplan::policy::Rule>>& rules) {
    return policy->evaluate_effects_lazy(
        propositional_task.compute_dlplan_state(source),
        propositional_task.compute_dlplan_state(target),
        rules,
        propositional_task.get_denotations_caches()) != nullptr;
}

}

static shared_ptr<policy::Policy> _parse(OptionParser &parser) {
    parser.document_synopsis("Policy", "");
    parser.add_option<string>("filename", "File of policy constants.", "policy.txt");
    Options opts = parser.parse();
    if (parser.dry_run()) {
        return nullptr;
    }
    return make_shared<policy::Policy>(opts);
}

static PluginTypePlugin<policy::Policy> _type_plugin("Policy", "");
static Plugin<policy::Policy> _plugin("policy", _parse);
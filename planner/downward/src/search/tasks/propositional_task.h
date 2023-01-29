#ifndef TASKS_PROPOSITIONAL_TASK_H
#define TASKS_PROPOSITIONAL_TASK_H

#include "delegating_task.h"

#include "../task_proxy.h"

#include <dlplan/core.h>

#include <memory>
#include <vector>

namespace extra_tasks {
const int UNDEFINED = -1;

class FactIndexer {
    std::vector<int> fact_offsets;
    std::vector<int> pair_offsets;
    int num_facts;
    int num_pairs;

public:
    explicit FactIndexer(const TaskProxy &task_proxy);

    int get_fact_id(FactPair fact) const {
        return fact_offsets[fact.var] + fact.value;
    }

    int get_pair_id(FactPair fact1, FactPair fact2) const {
        assert(fact1.var != fact2.var);
        if (!(fact1 < fact2)) {
            std::swap(fact1, fact2);
        }
        assert(fact1 < fact2);
        assert(utils::in_bounds(get_fact_id(fact1), pair_offsets));
        return pair_offsets[get_fact_id(fact1)] + get_fact_id(fact2);
    }

    int get_num_facts() const {
        return num_facts;
    }

    int get_num_pairs() const {
        return num_pairs;
    }

    void dump() const;
};


class PropositionalTask : public tasks::DelegatingTask {
private:
    std::shared_ptr<dlplan::core::VocabularyInfo> m_vocabulary_info;
    std::shared_ptr<dlplan::core::InstanceInfo> m_instance_info;
    dlplan::core::SyntacticElementFactory m_syntactic_element_factory;
    dlplan::core::DenotationsCaches m_denotations_caches;

    std::vector<int> fact_index_to_dlplan_atom_index;
    std::vector<bool> m_is_negated_facts;

    std::unordered_set<int> m_goal_fact_ids;

    std::shared_ptr<FactIndexer> m_fact_indexer;

public:
    PropositionalTask(const std::shared_ptr<AbstractTask> &parent, const TaskProxy &task_proxy);

    /**
     * Returns a propositional state.
     */
    dlplan::core::State compute_dlplan_state(const State& state) const;

    /**
     * For goal counter.
     */
    const std::unordered_set<int>& get_goal_fact_ids() const;
    std::vector<int> get_state_fact_ids(const State& state) const;
    bool is_negated_fact(int fact_id) const;

    /**
     * Getters.
     */
    dlplan::core::SyntacticElementFactory& get_syntactic_element_factory_ref();
    dlplan::core::DenotationsCaches& get_denotations_caches();
    std::shared_ptr<FactIndexer> get_fact_indexer();
};
}

#endif

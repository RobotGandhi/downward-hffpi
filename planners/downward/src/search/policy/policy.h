#include "../tasks/propositional_task.h"

#include <dlplan/policy.h>

#include <memory>


namespace options {
class Options;
}

namespace policy {

class Policy {
public:
    Policy(const options::Options &opts);

    std::vector<std::shared_ptr<const dlplan::policy::Rule>> evaluate_conditions_eager(
        const State& state);

    bool evaluate_effects_lazy(
        const State& source,
        const State& target,
        const std::vector<std::shared_ptr<const dlplan::policy::Rule>>& rules);

    const extra_tasks::PropositionalTask& get_propositional_task() const {
        return propositional_task;
    }

    const dlplan::policy::Policy& get_policy() const {
        return *policy;
    }

private:
    extra_tasks::PropositionalTask propositional_task;
    std::shared_ptr<const dlplan::policy::Policy> policy;

};

}
#include "../tasks/propositional_task.h"

#include <dlplan/policy.h>

#include <memory>


namespace options {
class Options;
}

namespace policy {

class Policy {
private:
    extra_tasks::PropositionalTask propositional_task;
    dlplan::policy::Policy policy;

public:
    Policy(const options::Options &opts);

    std::vector<std::shared_ptr<const dlplan::policy::Rule>> evaluate_conditions_eager(
        const State& state);

    bool evaluate_effects_lazy(
        const State& source,
        const State& target,
        const std::vector<std::shared_ptr<const dlplan::policy::Rule>>& rules);
};

}
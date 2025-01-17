#include <gtest/gtest.h>

#include "../../include/dlplan/core.h"

using namespace dlplan::core;


namespace dlplan::tests::core {

TEST(DLPTests, BooleanNullary) {
    auto vocabulary = std::make_shared<VocabularyInfo>();
    auto predicate_0 = vocabulary->add_predicate("predicate", 0);
    auto instance = std::make_shared<InstanceInfo>(vocabulary, 0);
    auto atom_0 = instance->add_atom("predicate", {});
    State state_0(instance, {atom_0}, 0);
    State state_1(instance, std::vector<Atom>(), 1);

    SyntacticElementFactory factory(vocabulary);

    auto boolean_0 = factory.parse_boolean("b_nullary(predicate)");
    EXPECT_EQ(boolean_0->evaluate(state_0), true);
    EXPECT_EQ(boolean_0->evaluate(state_1), false);
}

}

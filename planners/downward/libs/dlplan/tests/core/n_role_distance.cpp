#include <gtest/gtest.h>

#include "../utils/denotation.h"

#include "../../include/dlplan/core.h"

#include <limits>

using namespace dlplan::core;


namespace dlplan::tests::core {

TEST(DLPTests, NumericalRoleDistance) {
    auto vocabulary = std::make_shared<VocabularyInfo>();
    auto predicate_0 = vocabulary->add_predicate("conn", 2);
    auto predicate_1 = vocabulary->add_predicate("start", 2);
    auto predicate_2 = vocabulary->add_predicate("end", 2);
    auto predicate_3 = vocabulary->add_predicate("start2", 2);
    auto predicate_4 = vocabulary->add_predicate("end2", 2);
    auto predicate_5 = vocabulary->add_predicate("start3", 2);
    auto instance = std::make_shared<InstanceInfo>(vocabulary, 0);
    auto atom_0 = instance->add_atom("conn", {"A", "B"});
    auto atom_1 = instance->add_atom("conn", {"B", "C"});
    auto atom_2 = instance->add_atom("conn", {"C", "A"});
    auto atom_3 = instance->add_atom("conn", {"D", "E"});
    auto atom_4 = instance->add_atom("conn", {"E", "A"});
    auto atom_5 = instance->add_atom("start", {"X", "D"});  // distance 2: D -> E -> A
    auto atom_6 = instance->add_atom("end", {"X", "A"});
    auto atom_7 = instance->add_atom("end", {"X", "B"});
    auto atom_8 = instance->add_atom("start2", {"X", "B"});  // distance INF
    auto atom_9 = instance->add_atom("end2", {"X", "E"});

    State state_0(instance, {atom_0, atom_1, atom_2, atom_3, atom_4, atom_5, atom_6, atom_7, atom_8, atom_9}, 0);

    SyntacticElementFactory factory(vocabulary);

    // All distances are finite
    auto numerical_0 = factory.parse_numerical("n_role_distance(r_primitive(start,0,1),r_primitive(conn,0,1),r_primitive(end,0,1))");
    EXPECT_EQ(numerical_0->evaluate(state_0), 2);

    // If for at least one source there is no reachable target then the sum is defined as infinity
    auto numerical_1 = factory.parse_numerical("n_role_distance(r_primitive(start2,0,1),r_primitive(conn,0,1),r_primitive(end2,0,1))");
    EXPECT_EQ(numerical_1->evaluate(state_0), std::numeric_limits<int>::max());

    // SumRoleDistance with no sources is defined as 0
    auto numerical_2 = factory.parse_numerical("n_role_distance(r_primitive(start3,0,1),r_primitive(conn,0,1),r_primitive(end2,0,1))");
    EXPECT_EQ(numerical_2->evaluate(state_0), std::numeric_limits<int>::max());
}

}

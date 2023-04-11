#! /usr/bin/env python

from pathlib import Path
import shutil
import subprocess

from downward import suites
from downward.experiment import FastDownwardExperiment
from lab.experiment import Experiment, Run
from lab import tools
from lab.reports import Attribute, arithmetic_mean

import project


DIR = Path(__file__).resolve().parent
REPO = DIR.parent
DOWNWARD_REPO = REPO / "planners" / "downward"
BENCHMARKS_DIR = REPO / "benchmarks"
GP_DIR = REPO / "policies"
if project.REMOTE:
    SUITE = ["transport_thesis"]
    # SUITE = ["barman:p01.pddl", "blocksworld:p01.pddl", "childsnack:p01.pddl", "clear:p-50-0.pddl", "delivery:instance_3_2_0.pddl", "depots:p01.pddl", "driverlog:p01.pddl", "ferry:ferry-l3-c15.pddl", "freecell:p01.pddl", "gripper:p01.pddl", "miconic-with-fix:p01.pddl", "nomystery:p01.pddl", "n-puzzle:n-puzzle-3x3-s1140.pddl", "on:p-50-0.pddl", "parking:p01.pddl", "pipesworld-notankage:p01.pddl", "pipesworld-tankage:p01.pddl", "reward:instance_5x5_0.pddl", "satellite:p01.pddl", "sokoban:p01.pddl", "spanner:pfile01-001.pddl", "visitall:p01.pddl", "zenotravel:p01.pddl"]
    ENV = project.TetralithEnvironment(
        email="vikca761@student.liu.se",
        extra_options="#SBATCH --account=snic2022-22-820",
        memory_per_cpu="5G")
else:
    SUITE = ["nurikabe"]
    ENV = project.LocalEnvironment(processes=4)

TRANSLATE_OPTIONS = ["--translate-options", "--dump-predicates", "--dump-constants", "--dump-static-atoms", "--dump-goal-atoms"]

FF = "h=ff(transform=adapt_costs(one))"
BLIND = "h=blind(transform=adapt_costs(one))"
SEARCH_OPTIONS = "cost_type=one"
BOOST = 1000

CONFIGS = [
    # (f"ff", TRANSLATE_OPTIONS + ["--search-options", "--evaluator", FF, "--search", f"eager(single(h), preferred=[], {SEARCH_OPTIONS})"]),
    # (f"ff-pref-ff", TRANSLATE_OPTIONS + ["--search-options", "--evaluator", FF, "--search", f"eager(alt([single(h), single(h, pref_only=true)], boost={BOOST}), preferred=[h], {SEARCH_OPTIONS})"]),
    # (f"ff-pref-policy", TRANSLATE_OPTIONS + ["--search-options", "--evaluator", FF, "--search", f"eager(alt([single(h), single(h, pref_only=true)], boost={BOOST}), preferred=[], preferred_operators_policy=policy, {SEARCH_OPTIONS})"]),
    # (f"ff-pref-either", TRANSLATE_OPTIONS + ["--search-options", "--evaluator", FF, "--search", f"eager(alt([single(h), single(h, pref_only=true)], boost={BOOST}), preferred=[h], preferred_operators_policy=policy, {SEARCH_OPTIONS})"]),
    # (f"ff-lookahead-50-policy", TRANSLATE_OPTIONS + ["--search-options", "--evaluator", FF, "--search", f"eager(single(h), preferred=[], preferred_operators_policy=policy, policy_lookahead_limit=50, {SEARCH_OPTIONS})"]),
    # (f"ff-lookahead-policy", TRANSLATE_OPTIONS + ["--search-options", "--evaluator", FF, "--search", f"eager(single(h), preferred=[], preferred_operators_policy=policy, policy_lookahead_limit=infinity, {SEARCH_OPTIONS})"]),
    # (f"ff-lookahead-policy-pref-ff", TRANSLATE_OPTIONS + ["--search-options", "--evaluator", FF, "--search", f"eager(alt([single(h), single(h, pref_only=true)], boost={BOOST}), preferred=[h], preferred_operators_policy=policy, policy_lookahead_limit=infinity, {SEARCH_OPTIONS})"]),

    (f"blind", TRANSLATE_OPTIONS + ["--search-options", "--evaluator", BLIND, "--search", f"eager(single(h), preferred=[], {SEARCH_OPTIONS})"]),
    # (f"blind-pref-policy", TRANSLATE_OPTIONS + ["--search-options", "--evaluator", BLIND, "--search", f"eager(alt([single(h), single(h, pref_only=true)], boost={BOOST}), preferred=[], preferred_operators_policy=policy, {SEARCH_OPTIONS})"]),
    # (f"blind-lookahead-policy", TRANSLATE_OPTIONS + ["--search-options", "--evaluator", BLIND, "--search", f"eager(single(h), preferred=[], preferred_operators_policy=policy, policy_lookahead_limit=infinity, {SEARCH_OPTIONS})"]),
]

BUILD_OPTIONS = []
DRIVER_OPTIONS = [
    "--validate",
    "--overall-time-limit", "30m",
    "--overall-memory-limit", "4G",
]
ATTRIBUTES = [
    "cost",
    "coverage",
    "error",
    "run_dir",
    "expansions",
    "memory",
    "total_time",
    "planner_memory",
    "planner_time",
    "lookaheads",
    Attribute("score_expansions", min_wins=False, function=arithmetic_mean),
    Attribute("score_search_time", min_wins=False, function=arithmetic_mean),
    Attribute("score_total_time", min_wins=False, function=arithmetic_mean),
    Attribute("score_lookaheads", min_wins=False, function=arithmetic_mean)
]

class FastDownwardAlgorithm:
    def __init__(self, name, driver_options, component_options):
        self.name = name
        self.driver_options = driver_options
        self.component_options = component_options

    def __eq__(self, other):
        """Return true iff all components (excluding the name) match."""
        return (
            self.driver_options == other.driver_options and
            self.component_options == other.component_options
        )

class FastDownwardRun(Run):
    def __init__(self, exp, algo, task, gp_dir):
        Run.__init__(self, exp)
        self.algo = algo
        self.task = task

        self.driver_options = algo.driver_options[:]

        if self.task.domain_file is None:
            self.add_resource("task", self.task.problem_file, "task.sas", symlink=True)
            input_files = ["{task}"]
            # Without PDDL input files, we can't validate the solution.
            self.driver_options.remove("--validate")
        else:
            self.add_resource(
                "domain", self.task.domain_file, "domain.pddl", symlink=True
            )
            self.add_resource(
                "problem", self.task.problem_file, "problem.pddl", symlink=True
            )
            input_files = ["{domain}", "{problem}"]

        self.add_resource(
            "policy", gp_dir / "policy.txt", "policy.txt", symlink=True
        )

        self.add_command(
            "planner",
            [tools.get_python_executable()]
            + ["{planner}"]
            + self.driver_options
            + input_files
            + algo.component_options,
        )

        self._set_properties()

    def _set_properties(self):
        self.set_property("algorithm", self.algo.name)
        self.set_property("repo", DOWNWARD_REPO)
        self.set_property("local_revision", "main")
        self.set_property("global_revision", "main")
        self.set_property("build_options", BUILD_OPTIONS)
        self.set_property("driver_options", self.driver_options)
        self.set_property("component_options", self.algo.component_options)

        for key, value in self.task.properties.items():
            self.set_property(key, value)

        self.set_property("experiment_name", self.experiment.name)

        self.set_property("id", [self.algo.name, self.task.domain, self.task.problem])


class InPlaceExperiment(Experiment):
    def build(self, **kwargs):
        subprocess.run(["./build.py"], cwd=DOWNWARD_REPO, check=True)
        Experiment.build(self, **kwargs)

exp = InPlaceExperiment(environment=ENV)
cache_path = DOWNWARD_REPO
dest_path = Path("code")
exp.add_resource("", cache_path, dest_path)
# Overwrite the script to set the "planner" variable.
exp.add_resource(
    "planner",
    cache_path / "fast-downward.py",
    dest_path / "fast-downward.py",
)
for config_nick, config in CONFIGS:
    algo_name = f"{config_nick}"
    for task in suites.build_suite(BENCHMARKS_DIR, SUITE):
        algo = FastDownwardAlgorithm(
            algo_name,
            DRIVER_OPTIONS,
            config,
        )
        run = FastDownwardRun(exp, algo, task, GP_DIR / task.domain)
        exp.add_run(run)

exp.add_parser(FastDownwardExperiment.EXITCODE_PARSER)
exp.add_parser(FastDownwardExperiment.TRANSLATOR_PARSER)
exp.add_parser(FastDownwardExperiment.SINGLE_SEARCH_PARSER)
exp.add_parser(FastDownwardExperiment.PLANNER_PARSER)
exp.add_parser(DIR / "parser.py")

exp.add_step("build", exp.build)
exp.add_step("start", exp.start_runs)
exp.add_fetcher(name="fetch")
exp.add_parse_again_step()
project.add_absolute_report(
    exp, attributes=ATTRIBUTES, filter_algorithm=["blind", "ff-pref-ff", "blind-lookahead-policy", "ff-pref-policy", "ff-lookahead-policy"]
)

exp.run_steps()

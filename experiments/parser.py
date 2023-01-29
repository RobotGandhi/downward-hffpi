#! /usr/bin/env python

import math

from lab.parser import Parser


def add_scores(content, props):
    """
    Convert some properties into scores in the range [0, 1].
    Best possible performance in a task is counted as 1, while failure
    to solve a task and worst performance are counted as 0.
    """

    def log_score(value, min_bound, max_bound):
        if value is None or not props["coverage"]:
            return 0
        value = max(value, min_bound)
        value = min(value, max_bound)
        raw_score = math.log(value) - math.log(max_bound)
        best_raw_score = math.log(min_bound) - math.log(max_bound)
        return raw_score / best_raw_score

    for attr in ("expansions", "evaluations", "generated", "lookaheads"):
        props["score_" + attr] = log_score(
            props.get(attr), min_bound=100, max_bound=1e6
        )

    for attr in ("lookaheads"):
        props["score_" + attr] = log_score(
            props.get(attr), min_bound=1, max_bound=1e5
        )

    try:
        max_time = props["limit_search_time"]
    except KeyError:
        print("search time limit missing -> can't compute time scores")
    else:
        props["score_total_time"] = log_score(
            props.get("total_time"), min_bound=1.0, max_bound=max_time
        )
        props["score_search_time"] = log_score(
            props.get("search_time"), min_bound=1.0, max_bound=max_time
        )

    try:
        max_memory_kb = props["limit_search_memory"] * 1024
    except KeyError:
        print("search memory limit missing -> can't compute memory score")
    else:
        props["score_memory"] = log_score(
            props.get("memory"), min_bound=2000, max_bound=max_memory_kb
        )

def main():
    print("Running custom parser")
    parser = Parser()
    parser.add_pattern("lookaheads", "Policy lookaheads: (\d+)\n", type=int)
    parser.add_function(add_scores)
    parser.parse()

main()

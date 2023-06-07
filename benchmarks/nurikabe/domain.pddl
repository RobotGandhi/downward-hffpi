
(define (domain nurikabe)
(:requirements :typing :adl)
(:types
    cell num group - object
)
(:constants
    n0 - num
)
(:predicates
    (NEXT ?n1 - num ?n2 - num)
    (CONNECTED ?c - cell ?c2 - cell)
    (SOURCE ?x - cell ?g - group)
    (painted ?r - cell)
    (available ?x - cell)
    (part-of ?x - cell ?y - group)
    (blocked ?x - cell)
    (remaining-cells ?x - group ?y - num)
    (robot-pos ?x - cell)
    (moving)
    (painting ?g - group)
    (group-painted ?g - group)
)
(:action move
    :parameters (?from - cell ?to - cell)
    :precondition
    (and
        (CONNECTED ?from ?to)
        (moving)
        (not (painted ?to))
        (robot-pos ?from)
    )
    :effect
    (and
        (robot-pos ?to)
        (not (robot-pos ?from))
    )
)

(:action start-painting
    :parameters (?c - cell ?g - group ?n1 - num ?n2 - num)
    :precondition
    (and
        (NEXT ?n2 ?n1)
        (SOURCE ?c ?g)
        (moving)
        (robot-pos ?c)
        (remaining-cells ?g ?n1)
    )
    :effect
    (and
        (not (moving))
        (painting ?g)
        (painted ?c)
        (remaining-cells ?g ?n2)
        (not (remaining-cells ?g ?n1))
    )
)

(:action move-painting
    :parameters (?from - cell ?to - cell ?g - group ?n1 - num ?n2 - num)
    :precondition
    (and
        (NEXT ?n2 ?n1)
        (CONNECTED ?from ?to)
        (not (painted ?to))
        (not (blocked ?to))
        (painting ?g)
        (remaining-cells ?g ?n1)
        (robot-pos ?from)
    )
    :effect
    (and
        (robot-pos ?to)
        (not (robot-pos ?from))
        (painted ?to)
        (remaining-cells ?g ?n2)
        (not (remaining-cells ?g ?n1))
        (forall (?cadj - cell)
            (when
                (and
                    (CONNECTED ?to ?cadj)
                    (available ?cadj)
                )
                (and
                    (not (available ?cadj))
                    (part-of ?cadj ?g)
                )
            )
        )
        (forall (?cadj - cell)
            (when
                (and
                    (CONNECTED ?to ?cadj)
                    (not (available ?cadj))
                    (not (part-of ?cadj ?g))
                )
                (blocked ?cadj)
            )
        )
    )
)

(:action end-painting
    :parameters (?g - group)
    :precondition
    (and
        (painting ?g)
        (remaining-cells ?g n0)
    )
    :effect
    (and
        (not (painting ?g))
        (moving)
        (group-painted ?g)
    )
)

)

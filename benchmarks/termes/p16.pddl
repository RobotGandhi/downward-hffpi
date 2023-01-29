(define (problem termes-0600-10x10x6)
(:domain termes)
; termes-0600-10x10x6
; Initial state:
;  0   0   0   0   0  R0D  0   0   0   0 
;  0   0   0   0   0   0   0   0   0   0 
;  0   0   0   0   0   0   0   0   0   0 
;  0   0   0   0   0   0   0   0   0   0 
;  0   0   0   0   0   0   0   0   0   0 
;  0   0   0   0   0   0   0   0   0   0 
;  0   0   0   0   0   0   0   0   0   0 
;  0   0   0   0   0   0   0   0   0   0 
;  0   0   0   0   0   0   0   0   0   0 
;  0   0   0   0   0   0   0   0   0   0 
; Goal state:
;  0   1   0   1   0   0   1   0   0   6 
;  5   1   0   0   0   4   0   0   5   0 
;  1   0   0   0   0   0   0   0   0   0 
;  6   0   1   0   3   0   0   0   6   0 
;  0   6   5   0   0   0   0   0   1   1 
;  0   0   0   0   0   0   4   0   0   1 
;  0   0   6   6   5   5   4   0   6   0 
;  0   2   4   0   2   0   0   0   0   4 
;  3   0   0   0   4   5   0   0   0   0 
;  4   0   0   0   0   2   0   0   0   0 
; Maximal height: 6
(:objects
    n0 - numb
    n1 - numb
    n2 - numb
    n3 - numb
    n4 - numb
    n5 - numb
    n6 - numb
    pos-0-0 - position
    pos-0-1 - position
    pos-0-2 - position
    pos-0-3 - position
    pos-0-4 - position
    pos-0-5 - position
    pos-0-6 - position
    pos-0-7 - position
    pos-0-8 - position
    pos-0-9 - position
    pos-1-0 - position
    pos-1-1 - position
    pos-1-2 - position
    pos-1-3 - position
    pos-1-4 - position
    pos-1-5 - position
    pos-1-6 - position
    pos-1-7 - position
    pos-1-8 - position
    pos-1-9 - position
    pos-2-0 - position
    pos-2-1 - position
    pos-2-2 - position
    pos-2-3 - position
    pos-2-4 - position
    pos-2-5 - position
    pos-2-6 - position
    pos-2-7 - position
    pos-2-8 - position
    pos-2-9 - position
    pos-3-0 - position
    pos-3-1 - position
    pos-3-2 - position
    pos-3-3 - position
    pos-3-4 - position
    pos-3-5 - position
    pos-3-6 - position
    pos-3-7 - position
    pos-3-8 - position
    pos-3-9 - position
    pos-4-0 - position
    pos-4-1 - position
    pos-4-2 - position
    pos-4-3 - position
    pos-4-4 - position
    pos-4-5 - position
    pos-4-6 - position
    pos-4-7 - position
    pos-4-8 - position
    pos-4-9 - position
    pos-5-0 - position
    pos-5-1 - position
    pos-5-2 - position
    pos-5-3 - position
    pos-5-4 - position
    pos-5-5 - position
    pos-5-6 - position
    pos-5-7 - position
    pos-5-8 - position
    pos-5-9 - position
    pos-6-0 - position
    pos-6-1 - position
    pos-6-2 - position
    pos-6-3 - position
    pos-6-4 - position
    pos-6-5 - position
    pos-6-6 - position
    pos-6-7 - position
    pos-6-8 - position
    pos-6-9 - position
    pos-7-0 - position
    pos-7-1 - position
    pos-7-2 - position
    pos-7-3 - position
    pos-7-4 - position
    pos-7-5 - position
    pos-7-6 - position
    pos-7-7 - position
    pos-7-8 - position
    pos-7-9 - position
    pos-8-0 - position
    pos-8-1 - position
    pos-8-2 - position
    pos-8-3 - position
    pos-8-4 - position
    pos-8-5 - position
    pos-8-6 - position
    pos-8-7 - position
    pos-8-8 - position
    pos-8-9 - position
    pos-9-0 - position
    pos-9-1 - position
    pos-9-2 - position
    pos-9-3 - position
    pos-9-4 - position
    pos-9-5 - position
    pos-9-6 - position
    pos-9-7 - position
    pos-9-8 - position
    pos-9-9 - position
)
(:init
    (height pos-0-0 n0)
    (height pos-0-1 n0)
    (height pos-0-2 n0)
    (height pos-0-3 n0)
    (height pos-0-4 n0)
    (height pos-0-5 n0)
    (height pos-0-6 n0)
    (height pos-0-7 n0)
    (height pos-0-8 n0)
    (height pos-0-9 n0)
    (height pos-1-0 n0)
    (height pos-1-1 n0)
    (height pos-1-2 n0)
    (height pos-1-3 n0)
    (height pos-1-4 n0)
    (height pos-1-5 n0)
    (height pos-1-6 n0)
    (height pos-1-7 n0)
    (height pos-1-8 n0)
    (height pos-1-9 n0)
    (height pos-2-0 n0)
    (height pos-2-1 n0)
    (height pos-2-2 n0)
    (height pos-2-3 n0)
    (height pos-2-4 n0)
    (height pos-2-5 n0)
    (height pos-2-6 n0)
    (height pos-2-7 n0)
    (height pos-2-8 n0)
    (height pos-2-9 n0)
    (height pos-3-0 n0)
    (height pos-3-1 n0)
    (height pos-3-2 n0)
    (height pos-3-3 n0)
    (height pos-3-4 n0)
    (height pos-3-5 n0)
    (height pos-3-6 n0)
    (height pos-3-7 n0)
    (height pos-3-8 n0)
    (height pos-3-9 n0)
    (height pos-4-0 n0)
    (height pos-4-1 n0)
    (height pos-4-2 n0)
    (height pos-4-3 n0)
    (height pos-4-4 n0)
    (height pos-4-5 n0)
    (height pos-4-6 n0)
    (height pos-4-7 n0)
    (height pos-4-8 n0)
    (height pos-4-9 n0)
    (height pos-5-0 n0)
    (height pos-5-1 n0)
    (height pos-5-2 n0)
    (height pos-5-3 n0)
    (height pos-5-4 n0)
    (height pos-5-5 n0)
    (height pos-5-6 n0)
    (height pos-5-7 n0)
    (height pos-5-8 n0)
    (height pos-5-9 n0)
    (height pos-6-0 n0)
    (height pos-6-1 n0)
    (height pos-6-2 n0)
    (height pos-6-3 n0)
    (height pos-6-4 n0)
    (height pos-6-5 n0)
    (height pos-6-6 n0)
    (height pos-6-7 n0)
    (height pos-6-8 n0)
    (height pos-6-9 n0)
    (height pos-7-0 n0)
    (height pos-7-1 n0)
    (height pos-7-2 n0)
    (height pos-7-3 n0)
    (height pos-7-4 n0)
    (height pos-7-5 n0)
    (height pos-7-6 n0)
    (height pos-7-7 n0)
    (height pos-7-8 n0)
    (height pos-7-9 n0)
    (height pos-8-0 n0)
    (height pos-8-1 n0)
    (height pos-8-2 n0)
    (height pos-8-3 n0)
    (height pos-8-4 n0)
    (height pos-8-5 n0)
    (height pos-8-6 n0)
    (height pos-8-7 n0)
    (height pos-8-8 n0)
    (height pos-8-9 n0)
    (height pos-9-0 n0)
    (height pos-9-1 n0)
    (height pos-9-2 n0)
    (height pos-9-3 n0)
    (height pos-9-4 n0)
    (height pos-9-5 n0)
    (height pos-9-6 n0)
    (height pos-9-7 n0)
    (height pos-9-8 n0)
    (height pos-9-9 n0)
    (at pos-5-0)
    (SUCC n1 n0)
    (SUCC n2 n1)
    (SUCC n3 n2)
    (SUCC n4 n3)
    (SUCC n5 n4)
    (SUCC n6 n5)
    (NEIGHBOR pos-0-0 pos-1-0)
    (NEIGHBOR pos-0-0 pos-0-1)
    (NEIGHBOR pos-0-1 pos-1-1)
    (NEIGHBOR pos-0-1 pos-0-0)
    (NEIGHBOR pos-0-1 pos-0-2)
    (NEIGHBOR pos-0-2 pos-1-2)
    (NEIGHBOR pos-0-2 pos-0-1)
    (NEIGHBOR pos-0-2 pos-0-3)
    (NEIGHBOR pos-0-3 pos-1-3)
    (NEIGHBOR pos-0-3 pos-0-2)
    (NEIGHBOR pos-0-3 pos-0-4)
    (NEIGHBOR pos-0-4 pos-1-4)
    (NEIGHBOR pos-0-4 pos-0-3)
    (NEIGHBOR pos-0-4 pos-0-5)
    (NEIGHBOR pos-0-5 pos-1-5)
    (NEIGHBOR pos-0-5 pos-0-4)
    (NEIGHBOR pos-0-5 pos-0-6)
    (NEIGHBOR pos-0-6 pos-1-6)
    (NEIGHBOR pos-0-6 pos-0-5)
    (NEIGHBOR pos-0-6 pos-0-7)
    (NEIGHBOR pos-0-7 pos-1-7)
    (NEIGHBOR pos-0-7 pos-0-6)
    (NEIGHBOR pos-0-7 pos-0-8)
    (NEIGHBOR pos-0-8 pos-1-8)
    (NEIGHBOR pos-0-8 pos-0-7)
    (NEIGHBOR pos-0-8 pos-0-9)
    (NEIGHBOR pos-0-9 pos-1-9)
    (NEIGHBOR pos-0-9 pos-0-8)
    (NEIGHBOR pos-1-0 pos-0-0)
    (NEIGHBOR pos-1-0 pos-2-0)
    (NEIGHBOR pos-1-0 pos-1-1)
    (NEIGHBOR pos-1-1 pos-0-1)
    (NEIGHBOR pos-1-1 pos-2-1)
    (NEIGHBOR pos-1-1 pos-1-0)
    (NEIGHBOR pos-1-1 pos-1-2)
    (NEIGHBOR pos-1-2 pos-0-2)
    (NEIGHBOR pos-1-2 pos-2-2)
    (NEIGHBOR pos-1-2 pos-1-1)
    (NEIGHBOR pos-1-2 pos-1-3)
    (NEIGHBOR pos-1-3 pos-0-3)
    (NEIGHBOR pos-1-3 pos-2-3)
    (NEIGHBOR pos-1-3 pos-1-2)
    (NEIGHBOR pos-1-3 pos-1-4)
    (NEIGHBOR pos-1-4 pos-0-4)
    (NEIGHBOR pos-1-4 pos-2-4)
    (NEIGHBOR pos-1-4 pos-1-3)
    (NEIGHBOR pos-1-4 pos-1-5)
    (NEIGHBOR pos-1-5 pos-0-5)
    (NEIGHBOR pos-1-5 pos-2-5)
    (NEIGHBOR pos-1-5 pos-1-4)
    (NEIGHBOR pos-1-5 pos-1-6)
    (NEIGHBOR pos-1-6 pos-0-6)
    (NEIGHBOR pos-1-6 pos-2-6)
    (NEIGHBOR pos-1-6 pos-1-5)
    (NEIGHBOR pos-1-6 pos-1-7)
    (NEIGHBOR pos-1-7 pos-0-7)
    (NEIGHBOR pos-1-7 pos-2-7)
    (NEIGHBOR pos-1-7 pos-1-6)
    (NEIGHBOR pos-1-7 pos-1-8)
    (NEIGHBOR pos-1-8 pos-0-8)
    (NEIGHBOR pos-1-8 pos-2-8)
    (NEIGHBOR pos-1-8 pos-1-7)
    (NEIGHBOR pos-1-8 pos-1-9)
    (NEIGHBOR pos-1-9 pos-0-9)
    (NEIGHBOR pos-1-9 pos-2-9)
    (NEIGHBOR pos-1-9 pos-1-8)
    (NEIGHBOR pos-2-0 pos-1-0)
    (NEIGHBOR pos-2-0 pos-3-0)
    (NEIGHBOR pos-2-0 pos-2-1)
    (NEIGHBOR pos-2-1 pos-1-1)
    (NEIGHBOR pos-2-1 pos-3-1)
    (NEIGHBOR pos-2-1 pos-2-0)
    (NEIGHBOR pos-2-1 pos-2-2)
    (NEIGHBOR pos-2-2 pos-1-2)
    (NEIGHBOR pos-2-2 pos-3-2)
    (NEIGHBOR pos-2-2 pos-2-1)
    (NEIGHBOR pos-2-2 pos-2-3)
    (NEIGHBOR pos-2-3 pos-1-3)
    (NEIGHBOR pos-2-3 pos-3-3)
    (NEIGHBOR pos-2-3 pos-2-2)
    (NEIGHBOR pos-2-3 pos-2-4)
    (NEIGHBOR pos-2-4 pos-1-4)
    (NEIGHBOR pos-2-4 pos-3-4)
    (NEIGHBOR pos-2-4 pos-2-3)
    (NEIGHBOR pos-2-4 pos-2-5)
    (NEIGHBOR pos-2-5 pos-1-5)
    (NEIGHBOR pos-2-5 pos-3-5)
    (NEIGHBOR pos-2-5 pos-2-4)
    (NEIGHBOR pos-2-5 pos-2-6)
    (NEIGHBOR pos-2-6 pos-1-6)
    (NEIGHBOR pos-2-6 pos-3-6)
    (NEIGHBOR pos-2-6 pos-2-5)
    (NEIGHBOR pos-2-6 pos-2-7)
    (NEIGHBOR pos-2-7 pos-1-7)
    (NEIGHBOR pos-2-7 pos-3-7)
    (NEIGHBOR pos-2-7 pos-2-6)
    (NEIGHBOR pos-2-7 pos-2-8)
    (NEIGHBOR pos-2-8 pos-1-8)
    (NEIGHBOR pos-2-8 pos-3-8)
    (NEIGHBOR pos-2-8 pos-2-7)
    (NEIGHBOR pos-2-8 pos-2-9)
    (NEIGHBOR pos-2-9 pos-1-9)
    (NEIGHBOR pos-2-9 pos-3-9)
    (NEIGHBOR pos-2-9 pos-2-8)
    (NEIGHBOR pos-3-0 pos-2-0)
    (NEIGHBOR pos-3-0 pos-4-0)
    (NEIGHBOR pos-3-0 pos-3-1)
    (NEIGHBOR pos-3-1 pos-2-1)
    (NEIGHBOR pos-3-1 pos-4-1)
    (NEIGHBOR pos-3-1 pos-3-0)
    (NEIGHBOR pos-3-1 pos-3-2)
    (NEIGHBOR pos-3-2 pos-2-2)
    (NEIGHBOR pos-3-2 pos-4-2)
    (NEIGHBOR pos-3-2 pos-3-1)
    (NEIGHBOR pos-3-2 pos-3-3)
    (NEIGHBOR pos-3-3 pos-2-3)
    (NEIGHBOR pos-3-3 pos-4-3)
    (NEIGHBOR pos-3-3 pos-3-2)
    (NEIGHBOR pos-3-3 pos-3-4)
    (NEIGHBOR pos-3-4 pos-2-4)
    (NEIGHBOR pos-3-4 pos-4-4)
    (NEIGHBOR pos-3-4 pos-3-3)
    (NEIGHBOR pos-3-4 pos-3-5)
    (NEIGHBOR pos-3-5 pos-2-5)
    (NEIGHBOR pos-3-5 pos-4-5)
    (NEIGHBOR pos-3-5 pos-3-4)
    (NEIGHBOR pos-3-5 pos-3-6)
    (NEIGHBOR pos-3-6 pos-2-6)
    (NEIGHBOR pos-3-6 pos-4-6)
    (NEIGHBOR pos-3-6 pos-3-5)
    (NEIGHBOR pos-3-6 pos-3-7)
    (NEIGHBOR pos-3-7 pos-2-7)
    (NEIGHBOR pos-3-7 pos-4-7)
    (NEIGHBOR pos-3-7 pos-3-6)
    (NEIGHBOR pos-3-7 pos-3-8)
    (NEIGHBOR pos-3-8 pos-2-8)
    (NEIGHBOR pos-3-8 pos-4-8)
    (NEIGHBOR pos-3-8 pos-3-7)
    (NEIGHBOR pos-3-8 pos-3-9)
    (NEIGHBOR pos-3-9 pos-2-9)
    (NEIGHBOR pos-3-9 pos-4-9)
    (NEIGHBOR pos-3-9 pos-3-8)
    (NEIGHBOR pos-4-0 pos-3-0)
    (NEIGHBOR pos-4-0 pos-5-0)
    (NEIGHBOR pos-4-0 pos-4-1)
    (NEIGHBOR pos-4-1 pos-3-1)
    (NEIGHBOR pos-4-1 pos-5-1)
    (NEIGHBOR pos-4-1 pos-4-0)
    (NEIGHBOR pos-4-1 pos-4-2)
    (NEIGHBOR pos-4-2 pos-3-2)
    (NEIGHBOR pos-4-2 pos-5-2)
    (NEIGHBOR pos-4-2 pos-4-1)
    (NEIGHBOR pos-4-2 pos-4-3)
    (NEIGHBOR pos-4-3 pos-3-3)
    (NEIGHBOR pos-4-3 pos-5-3)
    (NEIGHBOR pos-4-3 pos-4-2)
    (NEIGHBOR pos-4-3 pos-4-4)
    (NEIGHBOR pos-4-4 pos-3-4)
    (NEIGHBOR pos-4-4 pos-5-4)
    (NEIGHBOR pos-4-4 pos-4-3)
    (NEIGHBOR pos-4-4 pos-4-5)
    (NEIGHBOR pos-4-5 pos-3-5)
    (NEIGHBOR pos-4-5 pos-5-5)
    (NEIGHBOR pos-4-5 pos-4-4)
    (NEIGHBOR pos-4-5 pos-4-6)
    (NEIGHBOR pos-4-6 pos-3-6)
    (NEIGHBOR pos-4-6 pos-5-6)
    (NEIGHBOR pos-4-6 pos-4-5)
    (NEIGHBOR pos-4-6 pos-4-7)
    (NEIGHBOR pos-4-7 pos-3-7)
    (NEIGHBOR pos-4-7 pos-5-7)
    (NEIGHBOR pos-4-7 pos-4-6)
    (NEIGHBOR pos-4-7 pos-4-8)
    (NEIGHBOR pos-4-8 pos-3-8)
    (NEIGHBOR pos-4-8 pos-5-8)
    (NEIGHBOR pos-4-8 pos-4-7)
    (NEIGHBOR pos-4-8 pos-4-9)
    (NEIGHBOR pos-4-9 pos-3-9)
    (NEIGHBOR pos-4-9 pos-5-9)
    (NEIGHBOR pos-4-9 pos-4-8)
    (NEIGHBOR pos-5-0 pos-4-0)
    (NEIGHBOR pos-5-0 pos-6-0)
    (NEIGHBOR pos-5-0 pos-5-1)
    (NEIGHBOR pos-5-1 pos-4-1)
    (NEIGHBOR pos-5-1 pos-6-1)
    (NEIGHBOR pos-5-1 pos-5-0)
    (NEIGHBOR pos-5-1 pos-5-2)
    (NEIGHBOR pos-5-2 pos-4-2)
    (NEIGHBOR pos-5-2 pos-6-2)
    (NEIGHBOR pos-5-2 pos-5-1)
    (NEIGHBOR pos-5-2 pos-5-3)
    (NEIGHBOR pos-5-3 pos-4-3)
    (NEIGHBOR pos-5-3 pos-6-3)
    (NEIGHBOR pos-5-3 pos-5-2)
    (NEIGHBOR pos-5-3 pos-5-4)
    (NEIGHBOR pos-5-4 pos-4-4)
    (NEIGHBOR pos-5-4 pos-6-4)
    (NEIGHBOR pos-5-4 pos-5-3)
    (NEIGHBOR pos-5-4 pos-5-5)
    (NEIGHBOR pos-5-5 pos-4-5)
    (NEIGHBOR pos-5-5 pos-6-5)
    (NEIGHBOR pos-5-5 pos-5-4)
    (NEIGHBOR pos-5-5 pos-5-6)
    (NEIGHBOR pos-5-6 pos-4-6)
    (NEIGHBOR pos-5-6 pos-6-6)
    (NEIGHBOR pos-5-6 pos-5-5)
    (NEIGHBOR pos-5-6 pos-5-7)
    (NEIGHBOR pos-5-7 pos-4-7)
    (NEIGHBOR pos-5-7 pos-6-7)
    (NEIGHBOR pos-5-7 pos-5-6)
    (NEIGHBOR pos-5-7 pos-5-8)
    (NEIGHBOR pos-5-8 pos-4-8)
    (NEIGHBOR pos-5-8 pos-6-8)
    (NEIGHBOR pos-5-8 pos-5-7)
    (NEIGHBOR pos-5-8 pos-5-9)
    (NEIGHBOR pos-5-9 pos-4-9)
    (NEIGHBOR pos-5-9 pos-6-9)
    (NEIGHBOR pos-5-9 pos-5-8)
    (NEIGHBOR pos-6-0 pos-5-0)
    (NEIGHBOR pos-6-0 pos-7-0)
    (NEIGHBOR pos-6-0 pos-6-1)
    (NEIGHBOR pos-6-1 pos-5-1)
    (NEIGHBOR pos-6-1 pos-7-1)
    (NEIGHBOR pos-6-1 pos-6-0)
    (NEIGHBOR pos-6-1 pos-6-2)
    (NEIGHBOR pos-6-2 pos-5-2)
    (NEIGHBOR pos-6-2 pos-7-2)
    (NEIGHBOR pos-6-2 pos-6-1)
    (NEIGHBOR pos-6-2 pos-6-3)
    (NEIGHBOR pos-6-3 pos-5-3)
    (NEIGHBOR pos-6-3 pos-7-3)
    (NEIGHBOR pos-6-3 pos-6-2)
    (NEIGHBOR pos-6-3 pos-6-4)
    (NEIGHBOR pos-6-4 pos-5-4)
    (NEIGHBOR pos-6-4 pos-7-4)
    (NEIGHBOR pos-6-4 pos-6-3)
    (NEIGHBOR pos-6-4 pos-6-5)
    (NEIGHBOR pos-6-5 pos-5-5)
    (NEIGHBOR pos-6-5 pos-7-5)
    (NEIGHBOR pos-6-5 pos-6-4)
    (NEIGHBOR pos-6-5 pos-6-6)
    (NEIGHBOR pos-6-6 pos-5-6)
    (NEIGHBOR pos-6-6 pos-7-6)
    (NEIGHBOR pos-6-6 pos-6-5)
    (NEIGHBOR pos-6-6 pos-6-7)
    (NEIGHBOR pos-6-7 pos-5-7)
    (NEIGHBOR pos-6-7 pos-7-7)
    (NEIGHBOR pos-6-7 pos-6-6)
    (NEIGHBOR pos-6-7 pos-6-8)
    (NEIGHBOR pos-6-8 pos-5-8)
    (NEIGHBOR pos-6-8 pos-7-8)
    (NEIGHBOR pos-6-8 pos-6-7)
    (NEIGHBOR pos-6-8 pos-6-9)
    (NEIGHBOR pos-6-9 pos-5-9)
    (NEIGHBOR pos-6-9 pos-7-9)
    (NEIGHBOR pos-6-9 pos-6-8)
    (NEIGHBOR pos-7-0 pos-6-0)
    (NEIGHBOR pos-7-0 pos-8-0)
    (NEIGHBOR pos-7-0 pos-7-1)
    (NEIGHBOR pos-7-1 pos-6-1)
    (NEIGHBOR pos-7-1 pos-8-1)
    (NEIGHBOR pos-7-1 pos-7-0)
    (NEIGHBOR pos-7-1 pos-7-2)
    (NEIGHBOR pos-7-2 pos-6-2)
    (NEIGHBOR pos-7-2 pos-8-2)
    (NEIGHBOR pos-7-2 pos-7-1)
    (NEIGHBOR pos-7-2 pos-7-3)
    (NEIGHBOR pos-7-3 pos-6-3)
    (NEIGHBOR pos-7-3 pos-8-3)
    (NEIGHBOR pos-7-3 pos-7-2)
    (NEIGHBOR pos-7-3 pos-7-4)
    (NEIGHBOR pos-7-4 pos-6-4)
    (NEIGHBOR pos-7-4 pos-8-4)
    (NEIGHBOR pos-7-4 pos-7-3)
    (NEIGHBOR pos-7-4 pos-7-5)
    (NEIGHBOR pos-7-5 pos-6-5)
    (NEIGHBOR pos-7-5 pos-8-5)
    (NEIGHBOR pos-7-5 pos-7-4)
    (NEIGHBOR pos-7-5 pos-7-6)
    (NEIGHBOR pos-7-6 pos-6-6)
    (NEIGHBOR pos-7-6 pos-8-6)
    (NEIGHBOR pos-7-6 pos-7-5)
    (NEIGHBOR pos-7-6 pos-7-7)
    (NEIGHBOR pos-7-7 pos-6-7)
    (NEIGHBOR pos-7-7 pos-8-7)
    (NEIGHBOR pos-7-7 pos-7-6)
    (NEIGHBOR pos-7-7 pos-7-8)
    (NEIGHBOR pos-7-8 pos-6-8)
    (NEIGHBOR pos-7-8 pos-8-8)
    (NEIGHBOR pos-7-8 pos-7-7)
    (NEIGHBOR pos-7-8 pos-7-9)
    (NEIGHBOR pos-7-9 pos-6-9)
    (NEIGHBOR pos-7-9 pos-8-9)
    (NEIGHBOR pos-7-9 pos-7-8)
    (NEIGHBOR pos-8-0 pos-7-0)
    (NEIGHBOR pos-8-0 pos-9-0)
    (NEIGHBOR pos-8-0 pos-8-1)
    (NEIGHBOR pos-8-1 pos-7-1)
    (NEIGHBOR pos-8-1 pos-9-1)
    (NEIGHBOR pos-8-1 pos-8-0)
    (NEIGHBOR pos-8-1 pos-8-2)
    (NEIGHBOR pos-8-2 pos-7-2)
    (NEIGHBOR pos-8-2 pos-9-2)
    (NEIGHBOR pos-8-2 pos-8-1)
    (NEIGHBOR pos-8-2 pos-8-3)
    (NEIGHBOR pos-8-3 pos-7-3)
    (NEIGHBOR pos-8-3 pos-9-3)
    (NEIGHBOR pos-8-3 pos-8-2)
    (NEIGHBOR pos-8-3 pos-8-4)
    (NEIGHBOR pos-8-4 pos-7-4)
    (NEIGHBOR pos-8-4 pos-9-4)
    (NEIGHBOR pos-8-4 pos-8-3)
    (NEIGHBOR pos-8-4 pos-8-5)
    (NEIGHBOR pos-8-5 pos-7-5)
    (NEIGHBOR pos-8-5 pos-9-5)
    (NEIGHBOR pos-8-5 pos-8-4)
    (NEIGHBOR pos-8-5 pos-8-6)
    (NEIGHBOR pos-8-6 pos-7-6)
    (NEIGHBOR pos-8-6 pos-9-6)
    (NEIGHBOR pos-8-6 pos-8-5)
    (NEIGHBOR pos-8-6 pos-8-7)
    (NEIGHBOR pos-8-7 pos-7-7)
    (NEIGHBOR pos-8-7 pos-9-7)
    (NEIGHBOR pos-8-7 pos-8-6)
    (NEIGHBOR pos-8-7 pos-8-8)
    (NEIGHBOR pos-8-8 pos-7-8)
    (NEIGHBOR pos-8-8 pos-9-8)
    (NEIGHBOR pos-8-8 pos-8-7)
    (NEIGHBOR pos-8-8 pos-8-9)
    (NEIGHBOR pos-8-9 pos-7-9)
    (NEIGHBOR pos-8-9 pos-9-9)
    (NEIGHBOR pos-8-9 pos-8-8)
    (NEIGHBOR pos-9-0 pos-8-0)
    (NEIGHBOR pos-9-0 pos-9-1)
    (NEIGHBOR pos-9-1 pos-8-1)
    (NEIGHBOR pos-9-1 pos-9-0)
    (NEIGHBOR pos-9-1 pos-9-2)
    (NEIGHBOR pos-9-2 pos-8-2)
    (NEIGHBOR pos-9-2 pos-9-1)
    (NEIGHBOR pos-9-2 pos-9-3)
    (NEIGHBOR pos-9-3 pos-8-3)
    (NEIGHBOR pos-9-3 pos-9-2)
    (NEIGHBOR pos-9-3 pos-9-4)
    (NEIGHBOR pos-9-4 pos-8-4)
    (NEIGHBOR pos-9-4 pos-9-3)
    (NEIGHBOR pos-9-4 pos-9-5)
    (NEIGHBOR pos-9-5 pos-8-5)
    (NEIGHBOR pos-9-5 pos-9-4)
    (NEIGHBOR pos-9-5 pos-9-6)
    (NEIGHBOR pos-9-6 pos-8-6)
    (NEIGHBOR pos-9-6 pos-9-5)
    (NEIGHBOR pos-9-6 pos-9-7)
    (NEIGHBOR pos-9-7 pos-8-7)
    (NEIGHBOR pos-9-7 pos-9-6)
    (NEIGHBOR pos-9-7 pos-9-8)
    (NEIGHBOR pos-9-8 pos-8-8)
    (NEIGHBOR pos-9-8 pos-9-7)
    (NEIGHBOR pos-9-8 pos-9-9)
    (NEIGHBOR pos-9-9 pos-8-9)
    (NEIGHBOR pos-9-9 pos-9-8)
    (IS-DEPOT pos-5-0)
)
(:goal (and
    (height pos-0-0 n0)
    (height pos-0-1 n5)
    (height pos-0-2 n1)
    (height pos-0-3 n6)
    (height pos-0-4 n0)
    (height pos-0-5 n0)
    (height pos-0-6 n0)
    (height pos-0-7 n0)
    (height pos-0-8 n3)
    (height pos-0-9 n4)
    (height pos-1-0 n1)
    (height pos-1-1 n1)
    (height pos-1-2 n0)
    (height pos-1-3 n0)
    (height pos-1-4 n6)
    (height pos-1-5 n0)
    (height pos-1-6 n0)
    (height pos-1-7 n2)
    (height pos-1-8 n0)
    (height pos-1-9 n0)
    (height pos-2-0 n0)
    (height pos-2-1 n0)
    (height pos-2-2 n0)
    (height pos-2-3 n1)
    (height pos-2-4 n5)
    (height pos-2-5 n0)
    (height pos-2-6 n6)
    (height pos-2-7 n4)
    (height pos-2-8 n0)
    (height pos-2-9 n0)
    (height pos-3-0 n1)
    (height pos-3-1 n0)
    (height pos-3-2 n0)
    (height pos-3-3 n0)
    (height pos-3-4 n0)
    (height pos-3-5 n0)
    (height pos-3-6 n6)
    (height pos-3-7 n0)
    (height pos-3-8 n0)
    (height pos-3-9 n0)
    (height pos-4-0 n0)
    (height pos-4-1 n0)
    (height pos-4-2 n0)
    (height pos-4-3 n3)
    (height pos-4-4 n0)
    (height pos-4-5 n0)
    (height pos-4-6 n5)
    (height pos-4-7 n2)
    (height pos-4-8 n4)
    (height pos-4-9 n0)
    (height pos-5-0 n0)
    (height pos-5-1 n4)
    (height pos-5-2 n0)
    (height pos-5-3 n0)
    (height pos-5-4 n0)
    (height pos-5-5 n0)
    (height pos-5-6 n5)
    (height pos-5-7 n0)
    (height pos-5-8 n5)
    (height pos-5-9 n2)
    (height pos-6-0 n1)
    (height pos-6-1 n0)
    (height pos-6-2 n0)
    (height pos-6-3 n0)
    (height pos-6-4 n0)
    (height pos-6-5 n4)
    (height pos-6-6 n4)
    (height pos-6-7 n0)
    (height pos-6-8 n0)
    (height pos-6-9 n0)
    (height pos-7-0 n0)
    (height pos-7-1 n0)
    (height pos-7-2 n0)
    (height pos-7-3 n0)
    (height pos-7-4 n0)
    (height pos-7-5 n0)
    (height pos-7-6 n0)
    (height pos-7-7 n0)
    (height pos-7-8 n0)
    (height pos-7-9 n0)
    (height pos-8-0 n0)
    (height pos-8-1 n5)
    (height pos-8-2 n0)
    (height pos-8-3 n6)
    (height pos-8-4 n1)
    (height pos-8-5 n0)
    (height pos-8-6 n6)
    (height pos-8-7 n0)
    (height pos-8-8 n0)
    (height pos-8-9 n0)
    (height pos-9-0 n6)
    (height pos-9-1 n0)
    (height pos-9-2 n0)
    (height pos-9-3 n0)
    (height pos-9-4 n1)
    (height pos-9-5 n1)
    (height pos-9-6 n0)
    (height pos-9-7 n4)
    (height pos-9-8 n0)
    (height pos-9-9 n0)
    (not (has-block))
))
)

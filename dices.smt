; Declare constants for the faces of the dice
(declare-const f1_1 Int)
(declare-const f1_2 Int)
(declare-const f1_3 Int)
(declare-const f1_4 Int)
(declare-const f1_5 Int)
(declare-const f1_6 Int)

(declare-const f2_1 Int)
(declare-const f2_2 Int)
(declare-const f2_3 Int)
(declare-const f2_4 Int)
(declare-const f2_5 Int)
(declare-const f2_6 Int)

(declare-const f3_1 Int)
(declare-const f3_2 Int)
(declare-const f3_3 Int)
(declare-const f3_4 Int)
(declare-const f3_5 Int)
(declare-const f3_6 Int)

; Define the dice as a function from face number (1 through 6) to value
; So, the function d1 returns the value on the face of the die corresponding to the input value x. 
; For example, if x is 4, d1 returns the value on the fourth face of the die.
(define-fun d1 ((x Int)) Int
    (ite (= x 1) f1_1
    (ite (= x 2) f1_2
    (ite (= x 3) f1_3
    (ite (= x 4) f1_4
    (ite (= x 5) f1_5
    (ite (= x 6) f1_6
    0))))))
)

(define-fun d2 ((x Int)) Int
    (ite (= x 1) f2_1
    (ite (= x 2) f2_2
    (ite (= x 3) f2_3
    (ite (= x 4) f2_4
    (ite (= x 5) f2_5
    (ite (= x 6) f2_6
    0))))))
)

(define-fun d3 ((x Int)) Int
    (ite (= x 1) f3_1
    (ite (= x 2) f3_2
    (ite (= x 3) f3_3
    (ite (= x 4) f3_4
    (ite (= x 5) f3_5
    (ite (= x 6) f3_6
    0))))))
)

; Values from 1 - 9
(assert (and (>= f1_1 1) (>= f1_2 1) (>= f1_3 1) (>= f1_4 1) (>= f1_5 1) (>= f1_6 1)
            (>= f2_1 1) (>= f2_2 1) (>= f2_3 1) (>= f2_4 1) (>= f2_5 1) (>= f2_6 1)
            (>= f3_1 1) (>= f3_2 1) (>= f3_3 1) (>= f3_4 1) (>= f3_5 1) (>= f3_6 1)
            (<= f1_1 9) (<= f1_2 9) (<= f1_3 9) (<= f1_4 9) (<= f1_5 9) (<= f1_6 9)
            (<= f2_1 9) (<= f2_2 9) (<= f2_3 9) (<= f2_4 9) (<= f2_5 9) (<= f2_6 9)
            (<= f3_1 9) (<= f3_2 9) (<= f3_3 9) (<= f3_4 9) (<= f3_5 9) (<= f3_6 9)))

; every 2 faces of the dice has the same value but between the "pairs" of faces, have different values
(assert (and (= f1_1 f1_2) (= f1_3 f1_4) (= f1_5 f1_6)
(not (= f1_1 f1_3)) (not (= f1_1 f1_4)) (not (= f1_1 f1_5)) (not (= f1_1 f1_6))
(not (= f1_2 f1_3)) (not (= f1_2 f1_4)) (not (= f1_2 f1_5)) (not (= f1_2 f1_6))
(not (= f1_3 f1_5)) (not (= f1_3 f1_6))
(not (= f1_4 f1_5)) (not (= f1_4 f1_6))))

(assert (and (= f2_1 f2_2) (= f2_3 f2_4) (= f2_5 f2_6)
(not (= f2_1 f2_3)) (not (= f2_1 f2_4)) (not (= f2_1 f2_5)) (not (= f2_1 f2_6))
(not (= f2_2 f2_3)) (not (= f2_2 f2_4)) (not (= f2_2 f2_5)) (not (= f2_2 f2_6))
(not (= f2_3 f2_5)) (not (= f2_3 f2_6))
(not (= f2_4 f2_5)) (not (= f2_4 f2_6))))

(assert (and (= f3_1 f3_2) (= f3_3 f3_4) (= f3_5 f3_6)
(not (= f3_1 f3_3)) (not (= f3_1 f3_4)) (not (= f3_1 f3_5)) (not (= f3_1 f3_6))
(not (= f3_2 f3_3)) (not (= f3_2 f3_4)) (not (= f3_2 f3_5)) (not (= f3_2 f3_6))
(not (= f3_3 f3_5)) (not (= f3_3 f3_6))
(not (= f3_4 f3_5)) (not (= f3_4 f3_6))))

; Constrain the dice to be intransitive
(assert 
    (exists 
        ((x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int))
        (and 
            (> (d1 x1) (d2 x1)) (> (d2 x1) (d3 x1))
            (> (d1 x2) (d2 x2)) (> (d2 x2) (d3 x2))
            (> (d1 x3) (d2 x3)) (> (d2 x3) (d3 x3))
            (> (d1 x4) (d2 x4)) (> (d2 x4) (d3 x4))
            (> (d1 x5) (d2 x5)) (> (d2 x5) (d3 x5))
            (> (d1 x6) (d2 x6)) (> (d2 x6) (d3 x6))
        )
    )
)

(check-sat)
(get-value (f1_1 f1_2 f1_3 f1_4 f1_5 f1_6 
            f2_1 f2_2 f2_3 f2_4 f2_5 f2_6
            f3_1 f3_2 f3_3 f3_4 f3_5 f3_6))
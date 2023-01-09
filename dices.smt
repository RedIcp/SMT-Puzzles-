; TODO: fix that a dice can have at most 2 sides equal.


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

; Values from 1 - 6
(assert (and (> f1_1 0) (> f1_2 0) (> f1_3 0) (> f1_4 0) (> f1_5 0) (> f1_6 0)
            (> f2_1 0) (> f2_2 0) (> f2_3 0) (> f2_4 0) (> f2_5 0) (> f2_6 0)
            (> f3_1 0) (> f3_2 0) (> f3_3 0) (> f3_4 0) (> f3_5 0) (> f3_6 0)
            (< f1_1 7) (< f1_2 7) (< f1_3 7) (< f1_4 7) (< f1_5 7) (< f1_6 7)
            (< f2_1 7) (< f2_2 7) (< f2_3 7) (< f2_4 7) (< f2_5 7) (< f2_6 7)
            (< f3_1 7) (< f3_2 7) (< f3_3 7) (< f3_4 7) (< f3_5 7) (< f3_6 7)))

; Constrain the dice to be intransitive
;(assert 
 ;   (forall ((x Int)) 
  ;      (and (> (d1 x) (d2 x)) (> (d2 x) (d3 x)))
   ; )
;)

; Constrain the dice to be partially intransitive
(assert (exists ((x1 Int) (x2 Int) (x3 Int) (x4 Int) (x5 Int) (x6 Int))
            (and (> (d1 x1) (d2 x1)) (> (d2 x1) (d3 x1))
                 (> (d1 x2) (d2 x2)) (> (d2 x2) (d3 x2))
                 (> (d1 x3) (d2 x3)) (> (d2 x3) (d3 x3))
                 (> (d1 x4) (d2 x4)) (> (d2 x4) (d3 x4))
                 (> (d1 x5) (d2 x5)) (> (d2 x5) (d3 x5))
                 (> (d1 x6) (d2 x6)) (> (d2 x6) (d3 x6)))))


; Check if there is a solution
(check-sat)
(get-value (f1_1 f1_2 f1_3 f1_4 f1_5 f1_6 
            f2_1 f2_2 f2_3 f2_4 f2_5 f2_6
            f3_1 f3_2 f3_3 f3_4 f3_5 f3_6))

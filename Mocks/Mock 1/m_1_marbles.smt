(declare-fun M (Int) Int)

;(define-const Mul Int 2)
;(define-const Plus Int 7)
;(define-const Min Int 5)

(assert (and
    ; initial -> (M 0) 4 (4 marbles at step 0)
    (= (M 0) 4)
    ; end -> (M 5) 5 (5 marbles at step 5)
    (= (M 5) 5)

    (or (=(M 1)(*(M 0) 2)) (=(M 1)(-(M 0) 5)) (=(M 1)(+(M 0) 7)))
    (or (=(M 2)(*(M 1) 2)) (=(M 2)(-(M 1) 5)) (=(M 2)(+(M 1) 7)))
    (or (=(M 3)(*(M 2) 2)) (=(M 3)(-(M 2) 5)) (=(M 3)(+(M 2) 7)))
    (or (=(M 4)(*(M 3) 2)) (=(M 4)(-(M 3) 5)) (=(M 4)(+(M 3) 7)))
    (or (=(M 5)(*(M 4) 2)) (=(M 5)(-(M 4) 5)) (=(M 5)(+(M 4) 7)))
)
)

; no negative numbers
;(assert (and (>= (M 1) 0)(>= (M 2) 0)(>= (M 3) 0) (>= (M 4) 0)))

(check-sat)
;(get-model)
(get-value ((M 0) (M 1) (M 2) (M 3) (M 4) (M 5)))
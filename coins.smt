; TODO it can take any amount of x,y and z


; Declare variables for the three denominations
(declare-const x Int)
(declare-const y Int)
(declare-const z Int)

; Require that the denominations are positive
(assert (> x 0))
(assert (> y 0))
(assert (> z 0))

; Require that the denominations are unique
(assert (not (= x y)))
(assert (not (= x z)))
(assert (not (= y z)))

; Require that the denominations can make 20, 23, and 29 centos
(assert (= 20 (+ x y z)))
(assert (= 23 (+ x y z)))
(assert (= 29 (+ x y z)))

; Find a solution
(check-sat)
; 5, 7, 11
(get-value (x y z))
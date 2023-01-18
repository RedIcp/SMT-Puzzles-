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
(assert (= 20 (+ x y y))) ;20 = 6 + 7 + 7
(assert (= 23 (+ x x z))) ;23 = 6 + 6 + 11
(assert (= 29 (+ y z z))) ;29 = 7 + 11 + 11

; Find a solution
(check-sat)
(get-value (x y z))
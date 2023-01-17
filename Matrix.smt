; MATRIX 1
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)
(declare-const tempA Int)
(declare-const tempB Int)
(declare-const tempC Int)
(declare-const tempD Int)
(declare-const detA Int)
(declare-const detB Int)
(declare-const detC Int)
(declare-const detD Int)
(declare-const determinent Int)
(declare-const result Int)

(assert (= a 3))
(assert (= b 1))
(assert (= c 5))
(assert (= d 2))


(assert (= determinent (- (* a d) (* c b))))
(assert (= result (/ 1 determinent)))
(assert (= tempB (- b)))
(assert (= tempC (- c)))

(assert (= tempD a))
(assert (= tempA d))

(assert (= detA (* result tempA)))
(assert (= detB (* result tempB)))
(assert (= detC (* result tempC)))
(assert (= detD (* result tempD)))

(check-sat)


(get-value (detA detB detC detD))
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)

(assert (> a 0))
(assert (< (f a true) 4))

(assert (= b (* 2 c)))
(assert (> (+ b d) (* 4 c)))
(assert (= d (* 4 c)))
(assert (distinct a b c d))

(check-sat)

(get-value (a b c d))
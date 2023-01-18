(declare-const k Int)
(declare-const a Int)
(declare-const n Int)
(declare-const s Int)
(declare-const m Int)
(declare-const i Int)
(declare-const e Int)
(declare-const v Int)
(declare-const d Int)
(declare-const t Int)


(assert (and 
        (>= k 0) (< k 10) 
        (>= a 0) (< a 10) 
        (>= n 0) (< n 10) 
        (>= s 0) (< s 10) 
        (>= m 0) (< m 10) 
        (>= i 0) (< i 10) 
        (>= e 0) (< e 10)
        (>= v 0) (< v 10)
        (>= d 0) (< d 10)
        (>= t 0) (< t 10)))

(assert (distinct k a n s m i e v d t))

(assert (= 
        (+ (* 100000 k) (* 10000 a) (* 1000 n) (* 100 s) (* 10 a) s (* 10000 m) (* 1000 a) (* 100 i) (* 10 n) e (* 100000 n) (* 10000 e) (* 1000 v) (* 100 a) (* 10 d) a)
        (+ (* 100000 s) (* 10000 t) (* 1000 a) (* 100 t) (* 10 e) s)
))


(check-sat)
(get-value (k a n s m i e v d t))
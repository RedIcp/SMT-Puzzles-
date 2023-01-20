(declare-const s Int)
(declare-const e Int)
(declare-const n Int)
(declare-const d Int)
(declare-const m Int)
(declare-const o Int)
(declare-const r Int)
(declare-const y Int)


(assert (and 
        (>= s 0) (< s 10) 
        (>= e 0) (< e 10) 
        (>= n 0) (< n 10) 
        (>= d 0) (< d 10) 
        (>= m 0) (< m 10) 
        (>= o 0) (< o 10) 
        (>= r 0) (< r 10) 
        (>= y 0) (< y 10)))

(assert (distinct s e n d m o r y))

(assert (= 
        (+ (* 1000 s) (* 100 e) (* 10 n) d (* 1000 m) (* 100 o) (* 10 r) e)
        (+ (* 10000 m) (* 1000 o) (* 100 n) (* 10 e) y)
))


(check-sat)
(get-value (s e n d m o r y))
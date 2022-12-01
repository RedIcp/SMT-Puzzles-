(declare-const s Int)
(declare-const e Int)
(declare-const n Int)
(declare-const d Int)
(declare-const m Int)
(declare-const o Int)
(declare-const r Int)
(declare-const y Int)

(declare-fun f (Int Bool) Int)

(assert (> s 0))
(assert (< (f s true) 9))

(assert (> e 0))
(assert (< (f e true) 9))

(assert (> n 0))
(assert (< (f n true) 9))

(assert (> d 0))
(assert (< (f d true) 9))

(assert (> m 0))
(assert (< (f m true) 9))

(assert (> o 0))
(assert (< (f o true) 9))

(assert (> r 0))
(assert (< (f r true) 9))

(assert (> y 0))
(assert (< (f y true) 9))

(assert (= 
        (+ (+ (+ s e)(+ n d)) (+ (+ m o)(+ r e))) 
        (+ (+ m o)(+ n (+ e y))))
)

(check-sat)
(get-value (s e n d m o r y))
; 28999 + 23131 = 52130
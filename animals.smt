(declare-const dogs Int)
(declare-const cats Int)
(declare-const mice Int)

;You have to buy at least one of each.
(assert (> dogs 0))
(assert (> cats 0))
(assert (> mice 0))

; Spend exactly 400 euro
(assert (= (+ (* 60 dogs) (* 4 cats) (* 1 mice)) 400))
; Buy exactly 100 animals
(assert (= (+ dogs cats mice) 100))

(check-sat)
(get-model)
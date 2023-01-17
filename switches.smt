; toggle, first parameter is round number second parameter is switch number
(declare-fun Toggle (Int Int) Bool)

(assert (and

; initial -> only switch 1 and 2 are on
    (= (Toggle 0 1) true)
    (= (Toggle 0 2) true)
    (= (Toggle 0 3) false)
    (= (Toggle 0 4) false)
    (= (Toggle 0 5) false)

; end -> all swicthes are on
    (= (Toggle 6 1) true)
    (= (Toggle 6 2) true)
    (= (Toggle 6 3) true)
    (= (Toggle 6 4) true)
    (= (Toggle 6 5) true)

))

(check-sat)
(get-model)
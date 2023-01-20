; toggle, first parameter is step number second parameter is switch number
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


    (forall ((step Int))
        (implies 
            (<= 1 step 5)
            (= 2
                (+ 
                    (ite (= 
                        (Toggle step 1) 
                        (not (Toggle (- step 1) 1))
                    )
                    1 0)
                    (ite (= 
                        (Toggle step 2) 
                        (not (Toggle (- step 1) 2))
                    )
                    1 0)
                    (ite (= 
                        (Toggle step 3) 
                        (not (Toggle (- step 1) 3))
                    )
                    1 0)
                    (ite (= 
                        (Toggle step 4) 
                        (not (Toggle (- step 1) 4))
                    )
                    1 0)
                    (ite (= 
                        (Toggle step 5) 
                        (not (Toggle (- step 1) 5))
                    )
                    1 0)
                )
            )
        )
    )
))

(check-sat)
(get-value (
    (Toggle 0 1)
	(Toggle 0 2)
	(Toggle 0 3)
	(Toggle 0 4)
	(Toggle 0 5)

	(Toggle 1 1)
	(Toggle 1 2)
	(Toggle 1 3)
	(Toggle 1 4)
	(Toggle 1 5)

	(Toggle 2 1)
	(Toggle 2 2)
	(Toggle 2 3)
	(Toggle 2 4)
	(Toggle 2 5)

	(Toggle 3 1)
	(Toggle 3 2)
	(Toggle 3 3)
	(Toggle 3 4)
	(Toggle 3 5)

	(Toggle 4 1)
	(Toggle 4 2)
	(Toggle 4 3)
	(Toggle 4 4)
	(Toggle 4 5)

	(Toggle 5 1)
	(Toggle 5 2)
	(Toggle 5 3)
	(Toggle 5 4)
	(Toggle 5 5)

    (Toggle 6 1)
	(Toggle 6 2)
	(Toggle 6 3)
	(Toggle 6 4)
	(Toggle 6 5)
))
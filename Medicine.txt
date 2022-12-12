;first parameter is round number second parameter is medicine number
;returns if already tested
(declare-fun Test (Int Int) Bool)

(assert (and

; adding medicine and checking if 3 medicine is there per round
(forall ((round Int))
	(= 3
		(+ 
			(ite (Test round 1) 1 0)
			(ite (Test round 2) 1 0)
			(ite (Test round 3) 1 0)
			(ite (Test round 4) 1 0)
			(ite (Test round 5) 1 0)
			(ite (Test round 6) 1 0)
			(ite (Test round 7) 1 0)
		)
	)
)

; checking if two medicine does not apear twice in two different round
(not (exists ((medicine1 Int) (medicine2 Int) (firstime Int) (secondtime Int))
	(and
		(<= 1 medicine1 7)
		(<= 1 medicine2 7)
		(<= 1 firstime 7)
		(<= 1 secondtime 7)
		(distinct medicine1 medicine2)
		(distinct firstime secondtime)

		(Test firstime medicine1)
		(Test firstime medicine2)
		(Test secondtime medicine1)
		(Test secondtime medicine2)
	)
))

; pair happened once
(forall ((medicine1 Int) (medicine2 Int))
	(implies
		(and
			(<= 1 medicine1 7)
			(<= 1 medicine2 7)
			(distinct medicine1 medicine2)
		)
		(exists ((round Int))
			(and
				(<= 1 round 7)
				(Test round medicine1)
				(Test round medicine2)
			)
		)
	)
)

))
(check-sat)
(get-value (
	(Test 1 1)
	(Test 1 2)
	(Test 1 3)
	(Test 1 4)
	(Test 1 5)
	(Test 1 6)
	(Test 1 7)

	(Test 2 1)
	(Test 2 2)
	(Test 2 3)
	(Test 2 4)
	(Test 2 5)
	(Test 2 6)
	(Test 2 7)

	(Test 3 1)
	(Test 3 2)
	(Test 3 3)
	(Test 3 4)
	(Test 3 5)
	(Test 3 6)
	(Test 3 7)

	(Test 4 1)
	(Test 4 2)
	(Test 4 3)
	(Test 4 4)
	(Test 4 5)
	(Test 4 6)
	(Test 4 7)

	(Test 5 1)
	(Test 5 2)
	(Test 5 3)
	(Test 5 4)
	(Test 5 5)
	(Test 5 6)
	(Test 5 7)

	(Test 6 1)
	(Test 6 2)
	(Test 6 3)
	(Test 6 4)
	(Test 6 5)
	(Test 6 6)
	(Test 6 7)

	(Test 7 1)
	(Test 7 2)
	(Test 7 3)
	(Test 7 4)
	(Test 7 5)
	(Test 7 6)
	(Test 7 7)
))

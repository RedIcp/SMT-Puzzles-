(declare-fun A (Int Int) Int)

(assert (and

; all entries are numbers from 1 to 6:
(forall ((m Int)(n Int))
	(implies
		(and
			(<= 1 m 6)
			(<= 1 n 6)
		)
		(<= 1 (A m n) 6)
	)
)

; rows, columns contain no duplicates:
(forall ((n Int))
	(implies
		(<= 1 n 6)
		(and
			(distinct (A 1 n) (A 2 n) (A 3 n) (A 4 n) (A 5 n) (A 6 n)) 
			(distinct (A n 1) (A n 2) (A n 3) (A n 4) (A n 5) (A n 6))
		)
	)
)

; Specifying the puzzle:

(= (A 1 2) 4)
(= (A 1 4) 2)
(= (A 2 3) 3)

(> (A 1 1) (A 1 2))
(> (A 1 3) (A 2 3))
(< (A 1 4) (A 1 5))
(< (A 2 1) (A 2 2))
(< (A 2 6) (A 3 6))
(> (A 3 6) (A 4 6))
(< (A 3 3) (A 4 3))
(> (A 3 4) (A 4 4))
(> (A 4 4) (A 4 5))
(> (A 4 5) (A 5 5))
(< (A 5 2) (A 6 2))
(> (A 5 3) (A 5 4))
(> (A 5 4) (A 6 4))
(> (A 1 1) (A 1 2))
(< (A 5 5) (A 6 5))
(> (A 5 6) (A 6 6))
(< (A 6 2) (A 6 3))
	
))
(check-sat)
(get-value (

(A 1 1) (A 2 1) (A 3 1) (A 4 1) (A 5 1) (A 6 1)
(A 1 2) (A 2 2) (A 3 2) (A 4 2) (A 5 2) (A 6 2)
(A 1 3) (A 2 3) (A 3 3) (A 4 3) (A 5 3) (A 6 3)
(A 1 4) (A 2 4) (A 3 4) (A 4 4) (A 5 4) (A 6 4)
(A 1 5) (A 2 5) (A 3 5) (A 4 5) (A 5 5) (A 6 5)
(A 1 6) (A 2 6) (A 3 6) (A 4 6) (A 5 6) (A 6 6)

))

((A 1 1) 5)((A 2 1) 1)((A 3 1) 3)((A 4 1) 6)((A 5 1) 4)((A 6 1) 2)
((A 1 2) 4)((A 2 2) 6)((A 3 2) 5)((A 4 2) 1)((A 5 2) 2)((A 6 2) 3)
((A 1 3) 6)((A 2 3) 3)((A 3 3) 1)((A 4 3) 2)((A 5 3) 5)((A 6 3) 4)
((A 1 4) 2)((A 2 4) 4)((A 3 4) 6)((A 4 4) 5)((A 5 4) 3)((A 6 4) 1)
((A 1 5) 3)((A 2 5) 5)((A 3 5) 2)((A 4 5) 4)((A 5 5) 1)((A 6 5) 6)
((A 1 6) 1)((A 2 6) 2)((A 3 6) 4)((A 4 6) 3)((A 5 6) 6)((A 6 6) 5)
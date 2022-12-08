;;queen position
(declare-fun x (Int) Int)
(declare-fun y (Int) Int)

(assert 
    (and
        ;;8 queens in the board
        (forall ((i Int))
            (implies
                (<= 1 i 8)
                (and
                    (<= 1 (x i) 8)
                    (<= 1 (y i) 8)
                )
            )
        )

        ;;only one queen by line
        (distinct (x 1) (x 2) (x 3) (x 4) (x 5) (x 6) (x 7) (x 8))

        ;;only one queen by column
        (distinct (y 1) (y 2) (y 3) (y 4) (y 5) (y 6) (y 7) (y 8))

        ;;only one queen by diagonal (2 diagonals in board)
        (distinct 
            (- (x 1)(y 1)) 
            (- (x 2)(y 2)) 
            (- (x 3)(y 3)) 
            (- (x 4)(y 4)) 
            (- (x 5)(y 5)) 
            (- (x 6)(y 6)) 
            (- (x 7)(y 7)) 
            (- (x 8)(y 8)) 
        )
        (distinct 
            (+ (x 1)(y 1)) 
            (+ (x 2)(y 2)) 
            (+ (x 3)(y 3)) 
            (+ (x 4)(y 4)) 
            (+ (x 5)(y 5)) 
            (+ (x 6)(y 6)) 
            (+ (x 7)(y 7)) 
            (+ (x 8)(y 8)) 
        )
    )
)

(check-sat)
(get-value( (x 1)(y 1)
            (x 2)(y 2)
            (x 3)(y 3)
            (x 4)(y 4)
            (x 5)(y 5)
            (x 6)(y 6)
            (x 7)(y 7)
            (x 8)(y 8))
)

;;x1y8 x2y8 x3y8 x4y8  Q   x6y8 x7y8 x8y8
;; Q   x2y7 x3y7 x4y7 x5y7 x6y7 x7y7 x8y7
;;Ix1y6 x2y6 x3y6  Q   x5y6 x6y6 x7y6 x8y6
;;x1y5 x2y5 x3y5 x4y5 x5y5  Q   x7y5 x8y5
;;x1y4 x2y4 x3y4 x4y4 x5y4 x6y4 x7y4  Q 
;;x1y3  Q   x3y3 x4y3 x5y3 x6y3 x7y3 x8y3
;;x1y2 x2y2 x3y2 x4y2 x5y2 x6y2  Q   x8y2
;;x1y1 x2y1  Q   x4y1 x5y1 x6y1 x7y1 x8y1
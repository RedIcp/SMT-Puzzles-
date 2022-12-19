(declare-const x0y0 Bool)
(declare-const x0y1 Bool)
(declare-const x0y2 Bool)
(declare-const x0y3 Bool)
(declare-const x1y0 Bool)
(declare-const x1y1 Bool)
(declare-const x1y2 Bool)
(declare-const x1y3 Bool)
(declare-const x2y0 Bool)
(declare-const x2y1 Bool)
(declare-const x2y2 Bool)
(declare-const x2y3 Bool)
(declare-const x3y0 Bool)
(declare-const x3y1 Bool)
(declare-const x3y2 Bool)
(declare-const x3y3 Bool)

;;4 queens in the board
(assert (or x0y0  x0y1  x0y2 x0y3))
(assert (or x1y0  x1y1  x1y2 x1y3))
(assert (or x2y0  x2y1  x2y2 x2y3))
(assert (or x3y0  x3y1  x3y2 x3y3))

;;only one queen by line
(assert (not (or(and x0y1 x0y0)(and x0y2 x0y0)(and x0y2 x0y1)(and x0y3 x0y0)(and x0y3 x0y1)(and x0y3 x0y2))))
(assert (not (or(and x1y1 x1y0)(and x1y2 x1y0)(and x1y2 x1y1)(and x1y3 x1y0)(and x1y3 x1y1)(and x1y3 x1y2))))
(assert (not (or(and x2y1 x2y0)(and x2y2 x2y0)(and x2y2 x2y1)(and x2y3 x2y0)(and x2y3 x2y1)(and x2y3 x2y2))))
(assert (not (or(and x3y1 x3y0)(and x3y2 x3y0)(and x3y2 x3y1)(and x3y3 x3y0)(and x3y3 x3y1)(and x3y3 x3y2))))

;;only one queen by column
(assert (not (or(and x1y0 x0y0)(and x2y0 x0y0)(and x2y0 x1y0)(and x3y0 x0y0)(and x3y0 x1y0)(and x3y0 x2y0))))
(assert (not (or(and x1y1 x0y1)(and x2y1 x0y1)(and x2y1 x1y1)(and x3y1 x0y1)(and x3y1 x1y1)(and x3y1 x2y1))))
(assert (not (or(and x1y2 x0y2)(and x2y2 x0y2)(and x2y2 x1y2)(and x3y2 x0y2)(and x3y2 x1y2)(and x3y2 x2y2))))
(assert (not (or(and x1y3 x0y3)(and x2y3 x0y3)(and x2y3 x1y3)(and x3y3 x0y3)(and x3y3 x1y3)(and x3y3 x2y3))))

;;only one queen by diagonal (2 diagonals in board)
(assert (not (or (and x0y0 x1y1) (and x0y0 x2y2) (and x0y0 x3y3) (and x1y1 x2y2) (and x1y1 x3y3) (and x2y2 x3y3))))
(assert (not (or (and x0y1 x1y2) (and x0y1 x2y3) (and x1y2 x2y3))))
(assert (not (or (and x0y2 x1y3))))
(assert (not (or (and x1y0 x2y1) (and x1y0 x3y2) (and x2y1 x3y2))))
(assert (not (or (and x2y0 x3y1))))
(assert (not (or (and x1y1 x0y0) (and x2y2 x0y0) (and x3y3 x0y0) (and x2y2 x1y1) (and x3y3 x1y1) (and x3y3 x2y2))))
(assert (not (or (and x1y2 x0y1) (and x2y3 x0y1) (and x2y3 x1y2))))
(assert (not (or (and x1y3 x0y2))))
(assert (not (or (and x2y1 x1y0) (and x3y2 x1y0) (and x3y2 x2y1))))
(assert (not (or (and x3y1 x2y0))))

(check-sat)
(get-value (x0y0 x0y1 x0y2 x0y3 
            x1y0 x1y1 x1y2 x1y3
            x2y0 x2y1 x2y2 x2y3
            x3y0 x3y1 x3y2 x3y3))
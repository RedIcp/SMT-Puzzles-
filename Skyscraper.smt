(declare-fun a1 () Int)
(declare-fun a2 () Int)
(declare-fun a3 () Int)
(declare-fun a4 () Int)
(declare-fun a5 () Int)

(declare-fun b1 () Int)
(declare-fun b2 () Int)
(declare-fun b3 () Int)
(declare-fun b4 () Int)
(declare-fun b5 () Int)

(declare-fun c1 () Int)
(declare-fun c2 () Int)
(declare-fun c3 () Int)
(declare-fun c4 () Int)
(declare-fun c5 () Int)

(declare-fun d1 () Int)
(declare-fun d2 () Int)
(declare-fun d3 () Int)
(declare-fun d4 () Int)
(declare-fun d5 () Int)

(declare-fun e1 () Int)
(declare-fun e2 () Int)
(declare-fun e3 () Int)
(declare-fun e4 () Int)
(declare-fun e5 () Int)


(assert (and (>= a1 1) (<= a1 5)))
(assert (and (>= a2 1) (<= a2 5)))
(assert (and (>= a3 1) (<= a3 5)))
(assert (and (>= a4 1) (<= a4 5)))
(assert (and (>= a5 1) (<= a5 5)))

(assert (and (>= b1 1) (<= b1 5)))
(assert (and (>= b2 1) (<= b2 5)))
(assert (and (>= b3 1) (<= b3 5)))
(assert (and (>= b4 1) (<= b4 5)))
(assert (and (>= a2 1) (<= a2 5)))

(assert (and (>= a2 1) (<= a2 5)))
(assert (and (>= a2 1) (<= a2 5)))
(assert (and (>= a2 1) (<= a2 5)))
(assert (and (>= a2 1) (<= a2 5)))
(assert (and (>= a2 1) (<= a2 5)))

(assert (and (>= a2 1) (<= a2 5)))
(assert (and (>= e5 1) (<= e5 5)))
(assert (and (>= e5 1) (<= e5 5)))
(assert (and (>= e5 1) (<= e5 5)))
(assert (and (>= e5 1) (<= e5 5)))

(assert (and (>= e5 1) (<= e5 5)))
(assert (and (>= e5 1) (<= e5 5)))
(assert (and (>= e5 1) (<= e5 5)))
(assert (and (>= e5 1) (<= e5 5)))
(assert (and (>= e5 1) (<= e5 5)))


(assert (distinct a1 a2 a3 a4 a5))
(assert (distinct b1 b2 b3 b4 b5))
...
(assert (distinct a1 b1 c1 d1 e1))
(assert (distinct a2 b2 c2 d2 e2))
...

(assert (ite (> a1 a2) 2 (ite (> a2 a1) 3 (ite (= a1 a2) 2 1)) == 2))
(assert (ite (> b1 b2) 2 (ite (> b2 b1) 3 (ite (= b1 b2) 2 1)) == 3))
...


(assert (ite (> a1 b1) 3 (ite (> b1 a1) 1 (ite (= a1 b1) 3 2)) == 3))
(assert (ite (> a2 b2) 3 (ite (> b2 a2) 1 (ite (= a2 b2) 3 2)) == 1))
...

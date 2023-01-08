; Declare constants for the tiles
(declare-const a Int)
(declare-const b Int)
(declare-const c Int)
(declare-const d Int)
(declare-const e Int)
(declare-const f Int)
(declare-const g Int)
(declare-const h Int)

; Require that the tiles are distinct integers from 1 to 8
(assert (distinct a b c d e f g h))
(assert (and (>= a 1) (<= a 8)))
(assert (and (>= b 1) (<= b 8)))
(assert (and (>= c 1) (<= c 8)))
(assert (and (>= d 1) (<= d 8)))
(assert (and (>= e 1) (<= e 8)))
(assert (and (>= f 1) (<= f 8)))
(assert (and (>= g 1) (<= g 8)))
(assert (and (>= h 1) (<= h 8)))

; Declare a function to check if a configuration is valid
(declare-fun valid (Int Int Int Int Int Int Int Int Int) Bool)

; Define the function to check if a configuration is valid
(define-fun valid ((a : Int) (b : Int) (c : Int) (d : Int) (e : Int) (f : Int) (g : Int) (h : Int)) : Bool
  (or (and (not (= e 0)) (= e (+ 1 a b c d g h)))
      (and (not (= d 0)) (= d (+ a b c e g h)))
      (and (not (= h 0)) (= h (+ a b c d e g)))

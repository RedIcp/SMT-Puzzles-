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
; This function defines the conditions that must be satisfied for a configuration to be considered valid. 
; It checks each tile to see if it is adjacent to the blank space and can be legally moved into it, 
; and it returns true if the configuration is valid and false if it is not.
(define-fun valid ((a Int) (b Int) (c Int) (d Int) (e Int) (f Int) (g Int) (h Int)) Bool
  (or (and (not (= e 0)) (= e (+ 1 a b c d g h)))
      (and (not (= d 0)) (= d (+ a b c e g h)))
      (and (not (= h 0)) (= h (+ a b c d e g)))
      (and (not (= g 0)) (= g (+ a b c d e h)))
      (and (not (= f 0)) (= f (+ a b c d e g)))
      (and (not (= b 0)) (= b (+ a c d e f g)))
      (and (not (= a 0)) (= a (+ b c d e f g)))
      (and (not (= c 0)) (= c (+ a b d e f g)))
  )
)

; Require that the initial configuration is valid
(assert (valid a b c d e f g h))

; Require that the final configuration is valid
(assert (valid 1 2 3 4 5 6 7 8))

; Find a solution
(check-sat)

; Print the solution
(get-value (a b c d e f g h))

(declare-const n Int)  ; size of the grid
(declare-const grid (Array Int Int))  ; grid of integers

(assert (= n 4))  ; for this example, we assume the grid is 4x4

(assert (and  ; constraints for rows
  (forall ((i Int))
    (and  ; all elements in a row are distinct
      (distinct (forall ((j Int)) (select grid i j)))
      ; clues for the rows
      (or (= (select grid i 0) 2) (= (select grid i 1) 2) (= (select grid i 2) 2) (= (select grid i 3) 2))
      (or (= (select grid i 0) 3) (= (select grid i 1) 3) (= (select grid i 2) 3) (= (select grid i 3) 3))
    )
  )
  ; constraints for columns
  (forall ((j Int))
    (and  ; all elements in a column are distinct
      (distinct (forall ((i Int)) (select grid i j)))
      ; clues for the columns
      (or (= (select grid 0 j) 1) (= (select grid 1 j) 1) (= (select grid 2 j) 1) (= (select grid 3 j) 1))
      (or (= (select grid 0 j) 4) (= (select grid 1 j) 4) (= (select grid 2 j) 4) (= (select grid 3 j) 4))
    )
  )
))

(assert (and  ; clues for the top row
  (or (= (select grid 0 0) 3) (= (select grid 0 1) 1) (= (select grid 0 2) 3) (= (select grid 0 3) 3))
  (or (= (select grid 0 0) 4) (= (select grid 0 1) 4) (= (select grid 0 2) 4) (= (select grid 0 3) 4))
))

(assert (and  ; clues for the bottom row
  (or (= (select grid 3 0) 1) (= (select grid 3 1) 1) (= (select grid 3 2) 1) (= (select grid 3 3) 1))
  (or (= (select grid 3 0) 2) (= (select grid 3 1) 2) (= (select grid 3 2) 2) (= (select grid 3 3) 2))
))

(assert (and  ; clues for the left column
  (or (= (select grid 0 0) 1) (= (select grid 1 0) 1) (= (select grid 2 0) 1) (= (select grid 3 0) 1))
  (or (= (select grid 0 0) 2) (= (select grid 1 0) 2) (= (select grid 2 0) 2) (= (select grid 3 0) 2))
))

(assert (and  ; clues for the right column
  (or (= (select grid 0 3) 3) (= (select grid 1 3) 3) (= (select grid 2 3) 3) (= (select grid 3 3) 3))
  (or (= (select grid 0 3) 4) (= (select grid 1 3) 4) (= (select grid 2 3) 4) (= (select grid 3 3) 4))
))

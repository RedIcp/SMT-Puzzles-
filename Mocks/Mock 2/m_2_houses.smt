(declare-const house1_color Int)
(declare-const house1_animal Int)
(declare-const house1_drink Int)
(declare-const house2_color Int)
(declare-const house2_animal Int)
(declare-const house2_drink Int)
(declare-const house3_color Int)
(declare-const house3_animal Int)
(declare-const house3_drink Int)

; Assert that the values of each attribute should be between 1 and 3
(assert (and 
    (< 0 house1_color 4)
    (< 0 house1_animal 4)
    (< 0 house1_drink 4)

    (< 0 house2_color 4)
    (< 0 house2_animal 4)
    (< 0 house2_drink 4)

    (< 0 house3_color 4)
    (< 0 house3_animal 4)
    (< 0 house3_drink 4)

    (distinct house1_color house2_color house3_color)
    (distinct house1_animal house2_animal house3_animal)
    (distinct house1_drink house2_drink house3_drink)

    ; Third house is not red
    (not (= house3_color 2))

    ; The person in house 2 drinks beer
    (= house2_drink 3)

    ; The fish lives in the pink house
    (or (and
        (= house1_color 1)
        (= house1_animal 1)
    )(and 
        (= house2_color 1)
        (= house2_animal 1)
    )(and 
        (= house3_color 1)
        (= house3_animal 1)
    ))

    ; The person drinking tea lives directly to the left of the pink house
    (or (and 
            (= house1_drink 1) 
            (= house2_color 1)) 
        (and 
            (= house2_drink 1) 
            (= house3_color 1)
    ))

    ; The zebra lives directly on the left of the fish
    (or (and 
            (= house1_animal 2) 
            (= house2_animal 1))
        (and 
            (= house2_animal 2)
            (= house3_animal 1)))
))


; H1 - H2 - H3
; 1 = Pink, 2 = Red, 3 = Yellow
; 1 = Fish, 2 = Zebra, 3 = Mouse
; 1 = Tea, 2 = Coffee, 3 = Beer


(check-sat)
(get-model)

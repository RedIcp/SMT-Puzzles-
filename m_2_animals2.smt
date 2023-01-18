(declare-const E Int)
(declare-const A Int)

(declare-const D Int)
(declare-const C Int)
(declare-const M Int)

(declare-const DC Int)
(declare-const CC Int)
(declare-const MC Int)

(assert(and

    (= E 400)
    (= A 100)

    (= DC 60)
    (= CC 4)
    (= MC 1)


    (>= D 1)
    (>= C 1)
    (>= M 1)

    (= A
        (+
            D
            C
            M
        )
    )

    (= E 
        (+
            (* DC D)
            (* CC C)
            (* MC M)
        )
    )
        
    )
)

(check-sat)
(get-model)
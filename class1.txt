(declare-const a Bool)
(declare-const b Bool)
(declare-const c Bool)
(declare-const d Bool)
(declare-const e Bool)

(define-fun conjecture () Bool
    (and 
        (and (=> not a b)(d))
    ((and 
        ((or (not b)((or (not c)(e)))))
    ((and 
        (not(not c = (and (not a)(b))))
    ((and (not e)(d))))))))
)

(assert (conjecture))
(check-sat)
(get-model)
(get-value (a b c d e))
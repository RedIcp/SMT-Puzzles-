(declare-fun m() Int)
(declare-fun s() Int)
(declare-fun h() Int)
(declare-fun t() Int)
(declare-fun l() Int)
(declare-fun v() Int)

(assert (and
    (<= 1 m 6)
    (<= 1 s 6)
    (<= 1 h 6)
    (<= 1 t 6)
    (<= 1 l 6)
    (<= 1 v 6)

    (distinct m s h t v l)

    ; condition 1, 1<s<=6 -> The sundial is not auctioned on June 1st.
    (>= s 2) ; or we change line 15 to (< 1 s 7)

    ; condition 2, if h<l -> m < l -> If the harmonica is earlier date than the lamp, then the mirror is also auctioned on an earlier date than the lamp
    (=> (< h l) (< m l))

    ; condition 3, s < m and s < v -> The sundial is auctioned on an earlier date than the mirror and also on an earlier date than the vase
    (and (< s m) (< s v))

    ; consition 4, t < h xor t < v -> The table is auctioned on an earlier date than the harmonica or on an earlier date than the vase, but not both
    (or (< t h) (< t v))
    (not(and(< t h) (< t v)))
))

; Q1 is this an accurate order list?
; (assert (and (= h 1) (= s 2) (= t 3) (= m 4) (= l 5) (= v 6)))

; Q2 The sundial is auctioned on June 2nd and the vase is auctioned on June 3rd
(assert (and (= s 2) (= v 3)))

; Q3 If the table is auctioned on a date that is later than both:
; the date on of the mirror and the date of the vase, 
; then the mirror is auctioned on an earlier date than the vase
; (assert (=> (and (< t m)(< t v)) (< m v)))

(check-sat)
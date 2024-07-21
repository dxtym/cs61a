#lang scheme

; square a num
(define (square x) (* x x))

; sum the squares of two nums
(define (sum-of-squares x y)
  (+ (square x) (square y)))

; find two max and sum their squares
(define (sum-of-square-of-two-max x y z)
  (cond ((and (>= x y) (>= x z)) (sum-of-squares x (max y z)))
        ((and (>= y z) (>= y x)) (sum-of-squares y (max x z)))
        (else (sum-of-squares z (max y x)))))

(sum-of-square-of-two-max 1 2 3)
       
  
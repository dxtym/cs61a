#lang scheme

; ackerman formula
(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

(define (f n) (* 2 n)) ; (A 0 n)

(define (g n) (expt 2 n)) ; (A 1 n)

(define (h n) (expt 2 (- n 1))) ; (A 2 n)
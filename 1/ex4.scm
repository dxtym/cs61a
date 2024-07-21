#lang scheme

(define (average x y) (/ (+ x y) 2)) 

(define (square x) (* x x))

(define (improve guess x)
  (average guess (/ x guess)))

; update based on improve rate
(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.00000001)) ; arbitrary number

; special form (applicative order func not work)
(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
       guess
       (sqrt-iter (improve guess x) x)))

(sqrt-iter 1.0 4)
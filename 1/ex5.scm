#lang scheme

(define (cube x)
  (* x x x))

(define (square x)
  (* x x))

(define (good-enough? previous-guess guess)
  (< (abs (/ (- guess previous-guess) guess)) 0.00000001))

; get better approx for cube root
(define (improve guess x)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (cube-root-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (cube-root-iter (improve guess x) x)))

(cube-root-iter 1.0 27) ; float to get floating number
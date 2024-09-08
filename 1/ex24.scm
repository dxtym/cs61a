#lang racket/base

(define tolerance 0.000001)

(define (close-enough? v1 v2)
  (< (abs (- v1 v2)) tolerance))

(define (fixed-point f first-guess)
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(display (fixed-point (lambda (x) (/ (log 1000) (log x))) 2)) (newline)

(define (average x y)
  (/ (+ x y) 2))

(display (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 2))

;; with average damping, answer converges faster
#lang racket/base

(define tolerance 0.00001)

(define (average x y)
  (/ (+ x y) 2))

(define (average-damp f)
  (lambda (x) (average x (f x))))

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (power x n)
  (if (= n 1)
      x
      (* x (power x (- n 1)))))

;; repeat average-dump log2n times and apply
;; that on lambda defined. shortly, was too
;; busy to do the experimentation, so decided
;; to get the function to compute minimal dump
(define (nth-root x n)
  (fixed-point
   ((repeated average-damp (floor (log n 2)))
    (lambda (y)
      (/ x (power y (- n 1)))))
   1.0))
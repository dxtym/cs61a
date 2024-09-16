#lang racket/base

(define dx 0.00001)

(define (average x y z)
  (/ (+ x y z) 3))

(define (compose f g)
  (lambda (x) (f (g x))))

(define (repeated f n)
  (if (= n 1)
      f
      (compose f (repeated f (- n 1)))))

(define (smooth f)
  (lambda (x)
    (average (f (- x dx)) (f x) (f (+ x dx)))))

(define (nth-smooth f n)
  (repeated (smooth f) n))
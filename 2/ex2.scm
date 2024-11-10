#lang racket/base

;; segment
(define (make-segment p1 p2) (cons p1 p2))
(define (start-segment l) (car l))
(define (end-segment l) (cdr l))

;; point
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

;; midpoint
(define (midpoint-segment l)
  (cons (/ (+ (x-point (start-segment l)) (x-point (end-segment l))) 2)
        (/ (+ (y-point (start-segment l)) (y-point (end-segment l))) 2)))

(define (print-point p)
  (newline)
  (display "(")
  (display (x-point p))
  (display ",")
  (display (y-point p))
  (display ")"))

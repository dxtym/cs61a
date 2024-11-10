#lang racket/base

;; point
(define (make-point x y) (cons x y))
(define (x-point p) (car p))
(define (y-point p) (cdr p))

;; segment
(define (make-segment p1 p2) (cons p1 p2))
(define (start-segment l) (car l))
(define (end-segment l) (cdr l))

;; rectangle
(define (perimeter r)
  (* 2 (+ (width r) (height r))))
(define (area r)
  (* (width r) (height r)))

;; how to represent rect? using 4 segments
(define (width r))
(define (height r))
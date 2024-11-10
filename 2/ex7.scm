#lang racket/base

;; interval
(define (make-interval a b) (cons a b))

(define (upper-bound p) (car p))

(define (lower-bound p) (cdr p))

;; same as set A \ B
;; find interval in A but not in B
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))
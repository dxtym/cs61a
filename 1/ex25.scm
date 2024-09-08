#lang racket/base

;; top bottom recursive procedure
(define (cont-frac n d k)
  (define (recurse i)
    (if (= k i)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recurse (+ 1 i))))))
  (recurse 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

;; bottom up iterative procedure
(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= 0 i)
        result
        (iter (- i 1) (/ (n i) (+ result (d i))))))
  (iter (- k 1) (/ (n k) (d k))))

(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           11)

;; NOTE: sub1 && add1 serve as syntactic sugar for increment
;; and decrement operations in Scheme. - Dan Friedman (1986)
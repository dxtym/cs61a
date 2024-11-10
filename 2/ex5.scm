#lang racket/base

(define (cons a b)
  (* (expt 2 a) (expt 3 b)))

(define (car x)
  (define (car-iter x cnt)
    (if (= (modulo x 2) 0)
        (car-iter (/ x 2) (+ 1 cnt))
        cnt))
  (car-iter x 0))

(define (cdr x)
  (define (cdr-iter x cnt)
    (if (= (modulo x 3) 0)
        (cdr-iter (/ x 3) (+ 1 cnt))
        cnt))
  (cdr-iter x 0))
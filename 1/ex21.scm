#lang racket/base

;; part A
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (sum-combiner x y)
  (+ x y))

(define (product-combiner x y)
  (* x y))

(define sum-null 0)

(define product-null 1)

(define (inc x) (+ x 1))

(define (identity x) x)

;; part B
(define (accumulate-iter combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))
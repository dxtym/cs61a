#lang racket/base

;; part A
(define (filtered-accumulate predicate? combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (if (predicate? a) (term a) null-value)
                (filtered-accumulate predicate? combiner null-value term (next a) next b))))

(define (sum-of-prime-squares a b)
  (filtered-accumulate prime? + 0 square a inc b))

(define (square x) (* x x))

(define (inc x) (+ x 1))

;; from prev exercise
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (+ 1 test-divisor)))))

(define (divides? a b)
  (= (remainder a b) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;; part B
(define (relative-prime? x n)
  (= (gcd x n) 1))

(define (identity x) x)

(define (product-of-relative-primes n)
  (filtered-accumulate relative-prime? * 1 identity 1 inc (- n 1)))
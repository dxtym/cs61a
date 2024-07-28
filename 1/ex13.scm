#lang scheme

(define (smallest-divisor n)
  (find-divisor n 2))

;; iterative process of finding smallest divisor of n
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (+ 1 test-divisor)))))

(define (square n)
  (* n n))

(define (divides? a b)
  (= (remainder a b) 0))

;; n prime <-> smallest divisor of n is n itself 
(define (prime? n)
  (= n (smallest-divisor n)))

;; 199 -> true
;; 1999 -> true
;; 19999 -> false
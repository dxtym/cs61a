#lang scheme

; even? a x b^n = a x b^(2 x n/2)
; odd? a x b^n = ab x b^(n - 1)

(define (even n)
  (= (remainder n 2) 0))

(define (square n)
  (* n n))

(define (fast-exp b n)
  (fast-exp-iter 1 b n))

(define (fast-exp-iter a b n)
  (cond ((= n 0) a)
        ((even? n) (fast-exp-iter a (square b) (/ n 2)))
        (else (fast-exp-iter (* a b) b (- n 1)))))

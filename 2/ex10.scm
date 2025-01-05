#lang racket/base

(define first-denom car)
(define except-first-denom cdr)
(define no-more? null?)

(define (cc amount coins)
  (cond ((= amount 0) 1)
        ((< amount 0) 0)
        ((no-more? coins) 0)
        (else
         (+ (cc amount
                (except-first-denom coins))
            (cc (- amount (first-denom coins))
                coins)))))
(define us-coins (list 50 25 10 5 1))
(define uk-coins (list 100 50 20 10 5 2 1 1/2))

(cc 100 us-coins) 
#lang racket/base

(define (runtime) (current-inexact-milliseconds))

;; finding smallest divisor
(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? n test-divisor) test-divisor)
        (else (find-divisor n (+ 1 test-divisor)))))

(define (square n)
  (* n n))

(define (divides? a b)
  (= (remainder a b) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

;; timing the search
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))
      #f))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes start end)
  (if (even? start)
      (search-for-primes (+ 1 start) end)
      (cond ((> start end)
            (newline) (display "finished"))
            (else (timed-prime-test start)
                  (search-for-primes (+ 2 start) end)))))

;; results:
;; > 1000: 0.0016
;; > 10000: 0.0046
;; > 100000: 0.0123
;; > 1000000: 0.039
;; ratios are between 2.875 - 3.17, somewhat equal to sqrt(10)
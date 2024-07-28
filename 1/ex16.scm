#lang racket/base

(define (runtime) (current-inexact-milliseconds))

;; finding with fermats theorem
(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n)
         (fast-prime? n (- times 1)))
        (else #f)))

(define (square n)
  (* n n))

;; timing the search
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
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
;; > 1000: 0.0386
;; > 10000: 0.0148
;; > 100000: 0.0176
;; > 1000000: 0.0191
;; actually, at first O(logn) solution is slower then O(sqrt(n))
;; but as the size of data increases, the fermat's test gets faster
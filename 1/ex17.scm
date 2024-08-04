#lang racket/base

(define (re-expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (re-remainder
          (re-expmod base (/ exp 2) m) m))
        (else
         (remainder (* base (re-expmod base (- exp 1) m))
                    m))))

(define (re-remainder x m)
  (if (and (not (or (= x 1)
                    (= x (- m 1))))
           (= (remainder (* x x) m) 1))
      0
      (remainder (* x x) m)))

;; a^(n-1) = 1(mod(n))
(define (miller-rabin-test n)
  (define (try-it a)
    (= (re-expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (miller-rabin-prime? n times)
  (cond ((= times 0) #t)
        ((miller-rabin-test n)
         (miller-rabin-prime? n (- times 1)))
        (else #f)))
                    
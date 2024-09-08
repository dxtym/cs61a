#lang racket/base

;; tanx = x / 1 - x^2 / 3 - x^2 / 5 - ...
;; lambert definition of tan function (1770)

(define (cont-frac-iter n d k)
  (define (iter i result)
    (if (= 0 i)
        result
        (iter (- i 1) (/ (n i) (+ result (d i))))))
  (iter (- k 1) (/ (n k) (d k))))

(define (tan-cf x k)
  (cont-frac-iter
   (lambda (i) (if (= i 1) x (* x x -1)))
   (lambda (i) (- (* 2.0 i) 1))
   k))

(display (tan-cf 1 10)) (newline)
(display (tan 1))
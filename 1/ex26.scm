#lang racket/base

;; group by 3 and choose 2nd position
;; this number doubles every sequence iter
(define (d-euler i)
  (if (= (modulo i 3) 2)
      (* 2 (/ (+ i 1) 3.0))
      1))

(define (cont-frac n d k)
  (define (recurse i)
    (if (= k i)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (recurse (+ 1 i))))))
  (recurse 1))

(cont-frac (lambda (i) 1) d-euler 11)

;; 0.7182818352059925
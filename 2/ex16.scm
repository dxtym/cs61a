#lang racket/base

;; enumerator -> filter -> map -> accumulator

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (accumulate op init (cdr seq)))))

(define (map p seq)
  (accumulate (lambda (x y) (cons (p x) y)) null seq))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length seq)
  (accumulate (lambda (x y) (+ 1 y)) 0 seq))

(define (horner-eval x coef-seq)
  (accumulate (lambda (this-coef high-term) (+ this-coef (* x high-term)))
              0
              coef-seq))

(define (count-leaves t)
  (accumulate + 0 (map (lambda (st)
                         (if (pair? st)
                             (count-leaves st)
                             1))
                       t)))
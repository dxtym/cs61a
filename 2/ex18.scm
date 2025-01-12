#lang racket/base

(define (fold-right op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (fold-right op init (cdr seq)))))

(define (fold-left op init seq)
  (define (iter res rest)
    (if (null? rest)
        res
        (iter (op res (car rest))
              (cdr rest))))
  (iter init seq))

(define (reverse-right seq)
  (fold-right (lambda (x y) (append y (list x))) null seq))

(define (reverse-left seq)
  (fold-left (lambda (x y) (append (list y) x)) null seq))
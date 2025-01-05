#lang racket/base

(define (last-pair items)
  (if (null? (cdr items))
      items
      (last-pair (cdr items))))

(define (reverse items)
  (if (null? items)
      null
      (append (reverse (cdr items)) (list (car items)))))
      
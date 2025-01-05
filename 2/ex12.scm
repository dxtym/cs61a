#lang racket/base

(define (square-list-recur items)
  (if (null? items)
      null
      (cons (* (car items) (car items))
            (square-list-recur (cdr items)))))

(square-list-recur (list 1 2 3 4 5))

(define (map proc items)
  (if (null? items)
      null
      (cons (proc (car items))
            (map proc (cdr items)))))

(define (square-list-map items)
  (map (lambda (x) (* x x)) items))

(square-list-map (list 1 2 3 4 5))

(define (for-each proc items)
  (if (null? items)
      (newline)
      (begin
        (proc (car items))
        (for-each proc (cdr items)))))

(for-each (lambda (x) (newline) (display x))
          (list 57 321 88))

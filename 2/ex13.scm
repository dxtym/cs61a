#lang racket/base

(define x (list 1 3 (list 5 7 ) 9))
(define y (list (list 7)))
(define z (list 1 (list 2 (list 3 (list 4 (list 5 (list 6 7)))))))

(car (cdr (car (cdr (cdr x)))))
(car (car y))
(car (cdr (car (cdr (car (cdr (car (cdr (car (cdr (car (cdr z))))))))))))

(define (reverse items)
  (if (null? items)
      null
      (append (reverse (cdr items)) (list (car items)))))

(define (deep-reverse items)
  (if (pair? items)
      (map deep-reverse (reverse items))
      items))

(deep-reverse (list (list 1 2) (list 3 4)))

(define (fringe items)
  (cond ((null? items) items)
        ((pair? (car items))
         (append (fringe (car items))
                 (fringe (cdr items))))
        (else (cons (car items) (fringe (cdr items))))))

(fringe (list (list 1 2) (list 3 4)))
(fringe (list (list (list 1 2) (list 3 4)) (list (list 1 2) (list 3 4))))
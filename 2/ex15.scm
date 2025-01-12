#lang racket/base

(define (square-tree-direct tree)
  (cond ((null? tree) null)
        ((pair? tree)
         (cons (square-tree-direct (car tree))
               (square-tree-direct (cdr tree))))
        (else (* tree tree))))

(define (square-tree-map tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (square-tree-map subtree)
             (* subtree subtree)))
       tree))

(define seq (list 1 (list 2 (list 3 4) 5) (list 6 7)))
(square-tree-direct seq)
(square-tree-map seq)

(define (tree-map fn tree)
  (map (lambda (subtree)
         (if (pair? subtree)
             (tree-map fn subtree)
             (fn subtree)))
       tree))

(define square (lambda (x) (* x x)))
(tree-map square seq)

(define (subsets s)
  (if (null? s)
      (list null)
      (let ((rest (subsets (cdr s))))
        (append rest
                (map (lambda (x) (cons (car s) x)) rest)))))

(subsets (list 1 2 3))
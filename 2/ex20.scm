#lang racket/base

(define (filter pred other)
  (cond ((null? other) '())
        ((pred (car other))
         (cons (car other) (filter pred (cdr other))))
        (else (filter pred (cdr other)))))

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq)
          (accumulate op init (cdr seq)))))

(define (flatmap proc seq)
  (accumulate append null (map proc seq)))

(define (enumerate-interval low high)
  (if (> low high)
      null
      (cons low (enumerate-interval (+ low 1) high))))

(define (any pred lst)
  (cond ((null? lst) #f)
        ((pred (car lst)) #t)
        (else (any pred (cdr lst)))))

(define empty-board nil)

(define (adjoin-position new-row k rest-of-queens)
  (cons (list new-row k) rest-of-queens))

(define (safe? k positions)
  (define (conflict? other current-queen)
    (let ((row1 (car current-queen))
          (row2 (car other))
          (col1 (cadr current-queen))
          (col2 (cadr other)))
      (or (= row1 row2) (= col1 col2)
          (= (abs (- row1 row2)) (abs (- col1 col2))))))
  (let ((current-queen (list (car (car positions)) k)))
    (not (any (lambda (other) (conflict? other current-queen))
              (cdr positions)))))
  
(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                    new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))
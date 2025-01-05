#lang racket/base

;; (define (f x y . z) <body>)
;; x and y will be certain args
;; z will be variadic args

(define (same-parity . other)
  (define (same-parity-helper pred other)
    (cond ((null? other) other)
          ((pred (car other))
           (cons (car other)
                 (same-parity-helper pred (cdr other))))
          (else (same-parity-helper pred (cdr other)))))
  (cond ((null? other) other)
        ((even? (car other)) (same-parity-helper even? other))
        (else (same-parity-helper odd? other))))

(same-parity 1 2 3 4 5 6)
(same-parity 2 3 4 5 6)
    
      
  
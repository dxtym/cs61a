#lang scheme

; recursive process
(define (f n)
  (cond ((< n 3) n)
        (else (+ (f (- n 1))
                (* 2 (f (- n 2)))
                (* 3 (f (- n 3)))))))

; iterative process
(define (f-iter n)
  (define (f-loop a b c nth)
    (if (= n nth)
        a
        (f-loop (+ a (* 2 b) (* 3 c))
                a
                b
                (+ 1 nth))))
  (if (< n 3)
      n
      (f-loop 2 1 0 2)))
  
                    
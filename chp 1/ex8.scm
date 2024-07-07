#lang scheme

; get pascal value for (row, col)
(define (pascal row col)
  (cond ((or (= row 1) (= col 1) (= row col)) 1)
        (else (+ (pascal (- row 1) (- col 1))
                 (pascal (- row 1) col)))))

; draw by column
(define (row-iter n)
  (define (col-iter i)
    (display (pascal n i)) (display " ")
    (if (= i n)
        (display "\n")
        (col-iter (+ i 1))))
  (col-iter 1))

; draw by row
(define (display-pascal n)
  (define (display-pascal-iter i)
    (row-iter i)
    (if (= i n)
        (display "\n")
        (display-pascal-iter (+ i 1))))
  (display-pascal-iter 1))
  
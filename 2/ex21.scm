#lang racket/base

(define (up-split painter n)
  (if (= n 0)
      painter
      (let ((smaller (up-split painter (- n 1))))
        (below painter (beside smaller smaller)))))

(define (split first second)
  (define (split-helper painter n)
    (if (= n 0)
        painter
        (let ((smaller (split-helper painter (- n 1))))
          (first painter (second smaller smaller)))))
  split-helper)

(define right-split-new (split beside below))
(define up-split-new (split below beside))
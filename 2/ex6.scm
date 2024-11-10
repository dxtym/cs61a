#lang racket/base

;; λfx.x
(define zero (lambda (f) (lambda (x) x)))

;; λnfx.fnfx
(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

;; λfx.fx
(define one (lambda (f) (lambda (x) (f (f x)))))

;; λfx.ffx
(define two (lambda (f) (lambda (x) (f (f (f x))))))

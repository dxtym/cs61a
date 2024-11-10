#lang racket/base

(define (make-point x y) (cons x y))

(define (perimeter r)
  (* 2 (+ (width-rec r) (height-rec r))))

(define (area r)
  (* (width-rec r) (height-rec r)))

(define (make-rect origin height width angle)
  (cons (cons width height) (cons origin angle)))

(define (width-rec r)
  (car (car r)))

(define (height-rec r)
  (cdr (car r)))

(define (origin-rec r)
  (car (cdr r)))

(define (angle-rec r)
  (cdr (cdr r)))

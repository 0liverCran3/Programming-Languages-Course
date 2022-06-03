#lang racket

;(define sum-evens(lambda(x) (modulo x 2))
  
(define cube (lambda (x) (* x x x)))

(define bigger (lambda (a b) (if (> a b) a b)))

(define biggest (lambda (a b c) (bigger (bigger a b) c)))

(define (digits n)
  (if (< n 10) 1 (+ 1 (digits (quotient n 10)))))
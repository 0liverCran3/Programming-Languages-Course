#lang racket

(define is-zero?
  (lambda (x) (null? x)))

(define succ
  (lambda (x) (cons '() x)))


(define pred  
  (lambda (x)
    (if (null? x) x
        (cdr x))))

(define translate
  (lambda (num)
    (if (zero? num)
        '()
        (cons '() (translate(- num 1))))))

(define untranslate
  (lambda (lst)
    (if (null? lst)
         0
         (+ 1 (untranslate (cdr lst))))))

(define add
  (lambda (m n)
    (if (is-zero? m) n
    (add (pred m) (succ n)))))

(define is-member?
  (lambda (lst item)
    (if (null? lst) #f
        (if (eq? item (car lst)) #t
            (is-member? (cdr lst) item)))))

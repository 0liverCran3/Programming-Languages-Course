#lang racket

(define member?
  (lambda (a lst)
    (cond
      ( (null? lst) #f)
      (else (or (eq? (car lst) a)
            (member? a (cdr lst)))))))

(define pick
  (lambda (a lst)
    (cond
      ( (= a 1) (car lst))
      (else (pick (- a 1) (cdr lst))))))

(define remember
  (lambda (a lst)
    (cond
      ( (null? lst) '())
      (else (if (eq? a (car lst))
              (cdr lst)
              (cons (car lst) (remember a (cdr lst))))))))

(define double-all
  (lambda (s)
    (cond
      ( (null? s) '())
      (else (cons (* 2 (car s))
                 (double-all (cdr s)))))))

(define evens
  (lambda (lst)
    (cond
      ( (null? lst) '())
      (else (if (even? (car lst))
                (cons (car lst) (evens (cdr lst)))
                (evens (cdr lst))
             )))))
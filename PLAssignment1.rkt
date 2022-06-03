#lang racket

;This is made by Oliver Crane 

;problem 1
(define (sum-evens lst)
  (cond
   ((null? lst)
   0)
   ((even? (car lst))
   (+ (car lst) (sum-evens (cdr lst))))
   (else(sum-evens (cdr lst)))))

;problem 2
(define append-item
        (lambda (x lst)
          (flatten (cons lst (list x)))))
          
;problem 3
(define (append-list lst1 lst2)
  (cond
    ((null? lst1)
        '())
    ((null? lst2)
            '())
    (else (append lst1 lst2))))
        

;problem 4
(define invert
  (lambda (x)
    (if (null? x)
        '()
        (map (lambda (z) (list (cadr z) (car z))) x)))) 

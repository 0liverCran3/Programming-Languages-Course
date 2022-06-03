#lang racket

; return the number of digits in a number
(define d
  (lambda (n)
    (cond ((< n 10) 1)
    (else (+ (d( quotient n 10)) 1)))
    )
  )

; len : list --> number
; function to calculate the length of a list
(define len
  (lambda (s)
    (cond [(null? s) 0]
          [else (+ 1 (len (cdr s)))]
          )
    )
  )

; len-even : list of positive integers --> number
; returns the number of even numbers in the list
(define len-even
  (lambda (s)
    (cond [(null? s) 0]
          [(even? (car s)) (+ 1 (len-even(cdr s )))]
          [else (len-even(cdr s))]
          )))

(define in-S?
  (lambda (x)
    (cond
      ( (< x 0) #f)
      ( (= 0 x) #t)
      (else (in-S? (- x 3)))
      )
    ))

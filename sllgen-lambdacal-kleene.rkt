#lang eopl

;<expr>		::= 	<id>
;		||	<number>
;		||	( <sub-expr> )
;<sub-expr>	::=	lambda ({<id>}*) <expr>
;		||	<expr>  {<expr>}*

(define scanner-spec-lc
  '((white-sp
     (whitespace) skip)
    (comment
     ("%" (arbno (not #\newline))) skip)
    (identifier
     (letter (arbno (or letter digit "?"))) symbol)
    (number
     (digit (arbno digit)) number)))

(define grammar-lc
  '((lc-exp (identifier) lit-exp)
    (lc-exp (number) var-exp)
    (lc-exp ("(" sublc-exp ")") sub-exp)
    (sublc-exp ("lambda" "(" (arbno identifier) ")" lc-exp)  lambda-exp)
    (sublc-exp (lc-exp (arbno lc-exp)) app-exp)))

(define scan&parse (sllgen:make-string-parser scanner-spec-lc grammar-lc))

(sllgen:make-define-datatypes scanner-spec-lc grammar-lc)

(define tests
  (list
   "x"
   "y"
   "(lambda (x) x)"
   "((lambda (x) x) y)"
   "(foo bar)"
   ))

(define test
  (lambda ()
    (for-each (lambda (x) (display (scan&parse x))
              (newline)) tests)))

#lang eopl

;concrete syntax
(define-datatype expr expr?
  (var-expr (id symbol?))
  (lambda-expr
   (id symbol?)
   (body expr?))
  (app-expr
   (rator expr?)
   (rand expr?))
  )

; parse function will be used to translate from concrete syntax to abstract syntax

(define parse
  (lambda (x)
    (cond
      ( (null? x) (eopl:error 'parse-expression "not a valid expr:" x))
      ((symbol? x) (var-expr x))
      ( (eqv? (car x) 'lambda)
        (lambda-expr (caadr x) (parse (caddr x))))
        (else
         (app-expr  (parse (car x))
                    (parse (cadr x)))
         ))))

(define unparse
  (lambda (x)
    (cases expr x
      (var-expr (id) id)
      (lambda-expr (id body) (list 'lambda (list id) (unparse body)))
      (app-expr (rator rand) (list (unparse rator) (unparse rand)))
      )))



; test cases
; x
; (lambda (x) x)
; (foo bar)


;(unparse (parse '(lambda(x) x)))
; (unparse (parse '((lambda (x) x) y)))


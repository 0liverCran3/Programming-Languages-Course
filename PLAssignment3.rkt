#lang eopl

;This is made by Oliver Crane

;problem 1 2.27
;I wrote the tree out on paper 

;problem 2 2.3

(define-datatype lc-exp lc-exp?
  (var-exp
   (var identifier?))
  (lambda-exp
   (bound-vars (list-of identifier?))
   (body lc-exp?))
  (app-exp
   (rator lc-exp?)
   (rands (list-of lc-exp?))))

(define identifier?
  (lambda (x)
    (and (symbol? x) (not (eqv? 'lambda x)))))

(define syntax-error
  (lambda (datum message)
    (parse-expression '((lambda (x) x) y))(eopl:error 'parse-expression
                (string-append "Syntax error: ~s is " message) datum)))

(define parse-expression
  (lambda (datum)
    (cond ((symbol? datum)
           (var-exp datum))
          ((pair? datum)
           (if (eqv? (car datum) 'lambda)
               (cond ((not (pair? (cdr datum)))
                      (syntax-error datum "missing list of bound variables"))
                     ((not (pair? (cddr datum)))
                      (syntax-error datum "missing the body"))
                     ((not ((list-of identifier?) (cadr datum)))
                      (syntax-error datum "not a list of bound variables"))
                     (else
                      (lambda-exp (cadr datum)
                                  (parse-expression (caddr datum)))))
               (if (not (list? datum))
                   (syntax-error datum "not an application expression")
                   (app-exp (parse-expression (car datum))
                            (map parse-expression (cdr datum))))))
          (else
           (syntax-error datum "not a lambda expression")))))


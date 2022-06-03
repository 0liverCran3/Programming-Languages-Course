#lang racket

(define rempick
  (lambda (num lst)
    (cond ( (zero? (- num 1)) (cdr lst))
          (else (cons (car lst) (rempick (- num 1)(cdr lst)))))))

(define TREE 'tree)

(define tree-make
  (lambda (datum left right)
    (if (and (number? datum)
             (tree? left)
             (tree? right))
        (list TREE datum left right)
        'error)))

(define tree-make-null
  (lambda () (list TREE)))

;Predicates
(define tree-null?
  (lambda (t)
    (and (not (null? t))
         (eq? (car t) TREE)
         (null? (cdr t)))))

(define tree?
  (lambda (t)
    (and (not (null? t))
         (eq? (car t) TREE)
         (or
          (and
           (= (length t) 4)
           (number? (cadr t))
           (tree? (caddr t))
           (tree? (cadddr t))
           ); end of inner and
          (null? (cdr t))
          )
         ); end of outer and
    ))

;accessors
(define tree-datum
  (lambda (t)
    (cond
      ( (not (tree? t)) 'error-not-tree)
      ( (tree-null? t) 'error-null-tree)
      (else (cadr t))
      )))

(define tree-right
  (lambda (t)
    (cond
      ((not (tree? t)) 'error-not-tree)
      ( (tree-null? t) 'error-null-tree)
      (else (cadddr t))
      )))

(define tree-left
  (lambda (t)
    (cond
      ((not (tree? t)) 'error-not-tree)
      ((tree-null? t) 'error-null-tree)
      (else (caddr t))
      )))

(define tree-add
  (lambda (num t)
    (cond
    ((not (tree? t)) 'error)
    ((tree-null? t) (tree-make num t t))
    (else (if(< num (tree-datum t))
             ;navigating left
             (tree-make (tree-datum t)
                        (tree-add num (tree-left t))
                        (tree-right t))
             ;navigating right
             (tree-make (tree-datum t)
                        (tree-left t)
                        (tree-add num (tree-right t)))
              )))))

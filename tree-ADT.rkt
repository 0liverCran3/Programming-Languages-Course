#lang racket
; Binary Tree using our own representation
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

;predicates
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

; accessors
(define tree-datum
  (lambda (t)
    (cond
      ((not (tree? t)) 'error-not-tree')
      ((tree-null? t) 'error-null-tree')
      (else (cadr t))
      )))

(define tree-left
  (lambda (t)
    (cond
      ((not (tree? t)) 'error-not-tree')
      ((tree-null? t) 'error-null-tree')
      (else (caddr t))
      )))
      

(define tree-right
  (lambda (t)
    (cond
      ((not (tree? t)) 'error-not-tree')
      ((tree-null? t) 'error-null-tree')
      (else (cadddr t))
      )))



        
#lang eopl

;This is made by Oliver Crane

;problem 1
(define-datatype binaryTree binaryTree?
  (null-node)
  (leaf-node (datum number?))
  (interior-node (key symbol?)
                 (left-child binaryTree?)
                 (right-child binaryTree?)))

(define bintree-to-list
  (lambda (tree)
    (cases binaryTree tree
      (null-node() empty)
      (leaf-node (v) v)
      (interior-node (sym left right)
                     (list (bintree-to-list left) (bintree-to-list right) )
                     ))))

;problem 2
(define merge
  (lambda (loi1 loi2)
    (sort (append loi1 loi2))))

(define sort
  (lambda (lst)
    (cond
      ((null? lst) '())
      ((= (car lst) (apply min lst))
          (cons (car lst) (sort (cdr lst))))
          (else (sort (append (cdr lst) (list (car lst))))
      ))))

;problem 3
(define differences
  (lambda (lst)
    (cond
      ( (null? lst) '())
      ( (null? (cdr lst)) '())
      (else
       (cons (- (cadr lst) (car lst)) (differences (cdr lst)))
         ))))
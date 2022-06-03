#lang eopl
(define-datatype binaryTree binaryTree?
  (null-node)
  (leaf-node (datum number?))
  (interior-node (key symbol?)
                 (left-child binaryTree?)
                 (right-child binaryTree?)))

(define leaf-node?
  (lambda (x)
    (cond
      ( (not (binaryTree? x)) #f)
      (else (cases binaryTree x
              (null-node () #f)
              (leaf-node (v) #t)
              (interior-node (a b c) #f))
            ))))
  

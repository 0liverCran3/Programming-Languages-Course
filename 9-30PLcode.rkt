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
      [(not (binaryTree? x)) #f]
      [else (cases binaryTree x
              (null-node () #f)
              (leaf-node (v) #t)
              (interior-node (a b c) #f))])))

(define sum-leaves
  (lambda (tree)
    (cases binaryTree tree
      (null-node() 0)
      (leaf-node (v) v)
      (interior-node (sym left right) (+ (sum-leaves left) (sum-leaves right) )
                     ))))
;sym and v are both variables that the tree utilizes to store information. 
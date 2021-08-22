(define (square-tree-1 tree)
  (map
    (lambda (sub-tree)
      (if (pair? sub-tree)
        (square-tree-1 sub-tree)
        (* sub-tree sub-tree)
      )
    )
    tree
  )
)

(define (square-tree-2 tree)
  (if (pair? tree)
    (cons
      (square-tree-2 (car tree))
      (square-tree-2 (cdr tree))
    )
    (if (null? tree)
      (list)
      (* tree tree)
    )
  )
)

(define (tree-map mapper tree)
  (if (pair? tree)
    (cons
      (tree-map mapper (car tree))
      (tree-map mapper (cdr tree))
    )
    (if (null? tree)
      (list)
      (mapper tree)
    )
  )
)

(define (square-tree-3 tree)
  (tree-map (lambda (x) (* x x)) tree)
)

(define test-tree (list 1 (list 2 (list 3 4) 5) (list 6 7)))

(display (square-tree-1 test-tree))
(newline)
(display (square-tree-2 test-tree))
(newline)
(display (square-tree-3 test-tree))
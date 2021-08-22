(define (square-list-1 items)
  (if (null? items)
    items
    (cons (* (car items) (car items)) (square-list (cdr items)))
  )
)

(define (square-list-2 items)
  (map (lambda (x) (* x x)) items)
)

(display (square-list-1 (list 1 2 3 4)))
(display (square-list-2 (list 1 2 3 4)))
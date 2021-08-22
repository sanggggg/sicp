
(define (cons x y)
  (lambda (m)
    (m x y)
  )
)

(define (cdr a)
  (a (lambda (x y) x))
)

(define (car a)
  (a (lambda (x y) y))
)
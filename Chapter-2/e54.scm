(define (equal? a b)
  (or
    (and (null? a) (null? b))
    (and 
      (pair? a)
      (pair? b)
      (eq? (car a) (car b))
      (equal? (cdr a) (cdr b)))))
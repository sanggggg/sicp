(define (deep-reverse l)
  (define (flip l result)
    (if (null? l)
      result
      (flip (cdr l) (cons (deep-reverse (car l)) result))
    )
  )
  (if (pair? l)
    (flip l '())
    l
  )
)


(display (deep-reverse (list (list 1 2) (list 3 4))))
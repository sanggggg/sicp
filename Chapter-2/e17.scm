
(define (last-pair list)
  (define (iter list)
    (if (null? (cdr list))
      list
      (iter (cdr list))
    )
  )
  (iter list)
)
(define (for-each process list)
  (if (null? list)
    true
    (and (process (car list)) (for-each process (cdr list)))
  )
)

(for-each (lambda (x) (newline) (display x)) (list 57 321 88))
(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence) (accumulate op initial (cdr sequence)))
  )
)

(define (count-leaves t)
  (accumulate
    +
    0
    (map
      (lambda (t)
        (cond
          ((pair? t) (count-leaves t))
          ((null? t) 0)
          (else 1)
        )
      )
      t
    )
  )
)

(display (count-leaves (list 1 (list (list 3 5) (list 3 4)))))
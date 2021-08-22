(define (get-divisor n r)
  (define (iter n result)
    (if (= (remainder n r) 0)
      (iter (/ n r) (+ 1 result))
      result
    )
  )
  (iter n 0)
)

(define (pow b e)
  (define (iter e result)
    (if (= e 0)
      result
      (iter (- e 1) (* b result))
    )
  )
  (iter e 1)
)

(define (cons x y)
  (* (pow 2 x) (pow 3 y))
)

(define (cdr a)
  (get-divisor a 2)
)

(define (car a)
  (get-divisor a 3)
)


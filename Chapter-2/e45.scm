(define (split a b)
  (lambda (painter)
    (if (= n 0)
      painter
      (let (((split a b) painter (- n 1)))
        (a painter (b smaller smaller))))))
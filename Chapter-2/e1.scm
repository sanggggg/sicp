(define (gcd a b)
  (if (= b 0)
    a
    (gcd b (remainder a b))
  )
)

(define (neg n) (- 0 n))

(define (make-rat n d)
  (if (< d 0)
    (make-rat (neg n) (neg d))
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))
    )
  )
)
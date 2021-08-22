(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence) (accumulate op initial (cdr sequence)))
  )
)

(define (flatmap proc seq)
  (accumulate append (list) (map proc seq))
)

(define (enumerate-interval start end)
  (cond
    ((> start end) (list))
    ((= start end) (list start))
    (else (cons start (enumerate-interval (+ start 1) end)))
  )
)

(define (unique-pairs n)
  (flatmap
    (lambda (i) 
      (map
        (lambda (j) (list j i))
        (enumerate-interval 1 (- i 1))
      )
    )
    (enumerate-interval 1 n)
  )
)

(define (prime-sum? pair)
  (prime? (+ (car pair) (cadr pair)))
)

(define (make-pair-sum pair)
  (list (car pair) (cadr pair) (+ (car pair) (cadr pair)))
)

(define (prime-sum-pairs n)
  (map
    make-pair-sum
    (filter 
      prime-sum?
      (unique-pairs n)
    )
  )
)

(prime-sum-pairs 10)
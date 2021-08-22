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

(define (unique-triples n)
  (flatmap
    (lambda (i)
      (flatmap
        (lambda (j) 
          (map
            (lambda (k) (list i j k))
            (enumerate-interval 1 (- j 1))
          )
        )
        (enumerate-interval 1 (- i 1))
      )
    )
    (enumerate-interval 1 n)
  )
)

(define (find-triple-sum s)
  (define (sum seq)
    (accumulate + 0 seq)
  )
  (filter 
    (lambda (triple) (= (sum triple) s))
    (unique-triples (ceil (/ (- s 1) 3)))
  )
)

(display (find-triple-sum 20))

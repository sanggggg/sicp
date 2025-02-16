(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence) (accumulate op initial (cdr sequence)))
  )
)

(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (i accum) (+ i (* x accum))) 0 coefficient-sequence)
)

(display (horner-eval 2 (list 1 3 0 5 0 1)))
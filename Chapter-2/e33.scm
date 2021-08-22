(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence) (accumulate op initial (cdr sequence)))
  )
)

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) (list) sequence)
)

(define (append seq1 seq2)
  (accumulate cons seq2 seq1)
)

(define (length sequence)
  (accumulate (lambda (x y) (+ y 1)) 0 sequence)
)

(display (length (list 1 2 34 4)))

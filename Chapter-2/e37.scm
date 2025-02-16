(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence) (accumulate op initial (cdr sequence)))
  )
)

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
    (list)
    (cons
      (accumulate op init (map car seqs))
      (accumulate-n op init (map cdr seqs))
    )
  )
)

(define (dot-product v w)
  (accumulate + 0 (map * v w))
)


(define (matrix-*-vector m v)
  (map (lambda (x) (dot-product x v)) m)
)

(define (transpose mat)
  (accumulate-n cons (list) mat)
)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (v) (matrix-*-vector m v)) n)
  )
)
(define (avg a b)
  (/ (+ a b) 2)
)

(define (make-segment p1 p2)
  (cons p1 p2)
)

(define (start-segment l)
  (car l)
)

(define (end-segment l)
  (cdr l)
)

(define (x-point p)
  (car p)
)

(define (y-point p)
  (cdr p)
)

(define (make-point x y)
  (cons x y)
)

(define (mid-point l)
  (let
    (
      (p1 (start-segment l))
      (p2 (end-segment l))
    )
    (let
      (
        (x1 (x-point p1))
        (y1 (y-point p1))
        (x2 (x-point p2))
        (y2 (y-point p2))
      )
      (make-point
        (avg x1 x2)
        (avg y1 y2)
      )
    )
  )
)
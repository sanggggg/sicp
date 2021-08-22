(define (make-interval l u)
  (if (or (= l 0) (= u 0))
    (error "interval should not contains zero bound")
    (cons l u)
  )
)

(define (make-center-width c w)
  (make-interval (- c (/ w 2) ) (+ c (/ w 2) ))
)

(define (make-center-percent c e)
  (make-center-width c (* e c 2))
)

(define (lower-bound interval)
  (cdr interval)
)

(define (upper-bound interval)
  (car interval)
)

(define (width interval)
  (- (upper-bound interval) (lower-bound interval))
)

(define (center interval)
  (/ (+ (upper-bound interval) (lower-bound interval)) 2)
)

(define (percent interval)
  (/ (- (upper-bound interval) (center interval)) (center interval))
)

(define (add-interval x y)
  (make-interval
    (+ (lower-bound x) (lower-bound y))
    (+ (upper-bound x) (upper-bound y))
  )
)

(define (mul-interval x y)
  (cond
    ((and (< (lower-bound x) 0) (< (upper-bound x) 0) (< (lower-bound y) 0) (< (upper-bound y) 0))
      (make-interval
        (* (upper-bound x) (upper-bound y) )
        (* (lower-bound x) (lower-bound y) )
      )
    )
    ((and (< (lower-bound x) 0) (> (upper-bound x) 0) (< (lower-bound y) 0) (< (upper-bound y) 0))
      (make-interval
        (* (upper-bound x) (lower-bound y) )
        (* (lower-bound x) (lower-bound y) )
      )
    )
    ((and (> (lower-bound x) 0) (> (upper-bound x) 0) (< (lower-bound y) 0) (< (upper-bound y) 0))
      (make-interval
        (* (upper-bound x) (lower-bound y) )
        (* (lower-bound x) (upper-bound y) )
      )
    )
    ((and (< (lower-bound x) 0) (< (upper-bound x) 0) (< (lower-bound y) 0) (> (upper-bound y) 0))
      (make-interval
        (* (lower-bound x) (upper-bound y) )
        (* (lower-bound x) (lower-bound y) )
      )
    )
    ((and (< (lower-bound x) 0) (> (upper-bound x) 0) (< (lower-bound y) 0) (> (upper-bound y) 0))
      (make-interval
        (min (* (lower-bound x) (upper-bound y)) (* (upper-bound x) (lower-bound y)))
        (max (* (upper-bound x) (upper-bound y)) (* (lower-bound x) (lower-bound y)))
      )
    )
    ((and (> (lower-bound x) 0) (> (upper-bound x) 0) (< (lower-bound y) 0) (> (upper-bound y) 0))
      (make-interval
        (* (upper-bound x) (lower-bound y) )
        (* (upper-bound x) (upper-bound y) )
      )
    )
    ((and (< (lower-bound x) 0) (< (upper-bound x) 0) (> (lower-bound y) 0) (> (upper-bound y) 0))
      (make-interval
        (* (lower-bound x) (upper-bound y) )
        (* (upper-bound x) (lower-bound y) )
      )
    )
    ((and (< (lower-bound x) 0) (> (upper-bound x) 0) (> (lower-bound y) 0) (> (upper-bound y) 0))
      (make-interval
        (* (lower-bound x) (upper-bound y) )
        (* (upper-bound x) (upper-bound y) )
      )
    )
    ((and (> (lower-bound x) 0) (> (upper-bound x) 0) (> (lower-bound y) 0) (> (upper-bound y) 0))
      (make-interval
        (* (lower-bound x) (lower-bound y) )
        (* (upper-bound x) (upper-bound y) )
      )
    )
  )
)

(define (div-interval x y)
  (mul-interval x
    (make-interval
      (/ 1 (upper-bound y))
      (/ 1 (lower-bound y))
    )
  )
)

(define (sub-interval x y)
  (make-interval
    (- (lower-bound x) (upper-bound y))
    (- (upper-bound x) (lower-bound y))
  )
)

(define (par1 r1 r2)
  (div-interval
    (mul-interval r1 r2)
    (add-interval r1 r2)
  )
)

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval
      one
      (add-interval 
        (div-interval one r1)
        (div-interval one r1)
      )
    )
  )
)
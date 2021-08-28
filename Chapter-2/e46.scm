(define (make-vector x y) (cons x y))
(define (xcor-vect v) (car v))
(define (ycor-vect v) (cdr v))

(define (add-vect v1 v2)
  (make-vector
    (+ (xcor-vect v1) (xcor-vect v2))
    (+ (ycor-vect v1) (ycor-vect v2))))

(define (scale-vect v s)
  (make-vector
    (* (xcor-vect v) s)
    (* (ycor-vect v) s)))

(define (sub-vect v1 v2)
  (add-vect v1 (scale-vect v2 - 1)))

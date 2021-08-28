(define (make-segment x1 y1 x2 y2)
  (cons (make-vect x1 y1) (make-vect x2 y2)))

(define start-segment car)
(define end-segment cdr)
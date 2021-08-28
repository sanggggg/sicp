(define outline-painter
  (segments-painter (list
    (make-segments 0 0 1 0)
    (make-segments 1 0 1 1)
    (make-segments 1 1 0 1)
    (make-segments 0 1 0 0))))

(define cross-painter
  (segments-painter (list
    (make-segments 0 0 1 1)
    (make-segments 1 0 0 1))))

(define diamond-painter
  (segments-painter (list
    (make-segments 0.5 0.0 1.0 0.5)
    (make-segments 1.0 0.5 0.5 1.0)
    (make-segments 0.5 1.0 0.0 0.5)
    (make-segments 0.0 0.5 0.5 0.0))))

;; skip wave 
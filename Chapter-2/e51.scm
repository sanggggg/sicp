(define (below painter1 painter2)
  (let (
    (paint-bottom 
      (transform-painter painter1
        (make-vect 0.0 0.0)
        (make-vect 1.0 0.0)
        (make-vect 0.0 0.5)))
    (paint-top
      (transform-painter painter2
        (make-vect 0.0 0.5)
        (make-vect 1.0 0.0)
        (make-vect 0.0 1.0))))))


;; another version
(define (below painter1 painter2)
  (rotate-90
    (beside
      (rotate-270 painter1
      (rotate-270 painter2)))))
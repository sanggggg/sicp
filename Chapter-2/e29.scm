(define (make-mobile left right)
  (cons left right)
)

(define (make-branch length structure)
  (cons length structure)
)

(define (left-branch mobile)
  (car mobile)
)

(define (right-branch mobile)
  (cdr mobile)
)

(define (branch-length branch)
  (car branch)
)

(define (branch-structure branch)
  (cdr branch)
)

(define (branch-weight branch)
  (define structure (branch-structure branch))
  (if (pair? structure)
    (total-weight structure)
    structure
  )
)

(define (branch-torque branch)
  (*
    (branch-weight branch)
    (branch-length branch)
  )
)

(define (total-weight mobile)
  (+ 
    (branch-weight (left-branch mobile))
    (branch-weight (right-branch mobile))
  )
)

(define (check-balanced structure)
  (if (pair? structure)
    (and
      (= (branch-torque (left-branch structure)) (branch-torque (right-branch structure)))
      (check-balanced (branch-structure (left-branch structure)))
      (check-balanced (branch-structure (right-branch structure)))
    )
    true
  )
)
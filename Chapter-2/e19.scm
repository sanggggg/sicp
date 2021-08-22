(define (except-first-denomination list)
  (cdr list)
)

(define (first-denomination list)
  (car list)
)

(define (no-more? list)
  (null? list)
)

(define (cc amount coin-values)
  (cond
    ((= amount 0) 1)
    ((or ( < amount 0) (no-more? coin-values)) 0)
    (else
      (+ 
        (cc amount
          (except-first-denomination coin-values))
        (cc (- amount (first-denomination coin-values))
          coin-values))
    )
  )
)


order of coin list do not effects result
because it counts every cases
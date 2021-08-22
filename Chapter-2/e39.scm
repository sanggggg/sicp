(define (fold-right op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence) (fold-right op initial (cdr sequence)))
  )
)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
      result
      (iter (op result (car rest)) (cdr rest))
    )
  )
  (iter initial sequence)
)
(define (reverse-left seq)
  (fold-left (lambda (acc next) (append (list next) acc))(list) seq)
)

(define (reverse-right seq)
  (fold-left (lambda (acc next) (cons next acc))(list) seq)
)
 
(display (reverse-left (list 1 2 3 4)))
(newline)
(display (reverse-right (list 1 2 3 4)))
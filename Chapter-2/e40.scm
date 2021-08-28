(define (make-position col row) (cons col row))
(define (get-col pos) (car pos))
(define (get-row pos) (cdr pos))
(define (is-conflict p1 p2)
  (or
    (= (get-col p1) (get-col p2))
    (= (get-row p1) (get-row p2))
    (= 
      (abs (- (get-col p1) (get-col p2)))
      (abs (- (get-row p1) (get-row p2)))
    )
  )
)

(define (equals p1 p2)
  (and 
    (= (get-col p1) (get-col p2))
    (= (get-row p1) (get-row p2))
  ))

(define (flatmap proc seq)
  (accumulate append (list) (map proc seq)))

(define (accumulate op initial sequence)
  (if (null? sequence)
    initial
    (op (car sequence) (accumulate op initial (cdr sequence)))))

(define (enumerate-interval start end)
  (cond
    ((> start end) (list))
    ((= start end) (list start))
    (else (cons start (enumerate-interval (+ start 1) end)))
  )
)

(define (pos-after positions target)
  (if (equals (car positions) target)
    (cdr positions)
    (pos-after (cdr positions) target)))

(define (safe? k positions)
  (not
    (accumulate 
      (lambda (next accum) (or (is-conflict (car next) (cdr next)) accum))
      false
      (flatmap
        (lambda
          (p1)
          (map
            (lambda
              (p2)
              (cons p1 p2))
            (pos-after positions p1)))
        positions))))

(define (adjoin-position new-row k rest-of-queens)
  (append rest-of-queens (list (make-position k new-row))))

(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
      (list (list))
      (filter
        (lambda (positions) (safe? k positions))
        (flatmap
          (lambda (rest-of-queens)
            (map
              (lambda (new-row)
                (adjoin-position new-row k rest-of-queens))
              (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))
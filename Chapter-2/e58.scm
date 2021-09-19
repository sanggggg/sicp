;;a
(define (make-sum a1 a2)
  (cond
    ((=number? a1 0) a2)
    ((=number? a2 0) a1)
    ((and (number? a1) (number? a2)) (+ a1 a2))
    (else (list a1 '+ a2))))

(define (addend exp) (car exp))

(define (augend exp) (caddr exp))

(define (make-exponentiation a1 a2)
  (cond
    ((=number? a2 0) 1)
    ((=number? a2 1) a1)
    (else (list '** a1 a2))))

;;b
(define (make-sum a1 a2)
  (cond
    ((=number? a1 0) a2)
    ((=number? a2 0) a1)
    ((and (number? a1) (number? a2)) (+ a1 a2))
    (else (list a1 '+ a2))))

(define (addend exp) (car exp))

(define (augend exp) 
  (let ((remain (cddr exp))) 
    (if (= (length remain) 1) 
      (car remain) 
      (cons '+ remain)))) 


(define (make-exponentiation a1 a2)
  (cond
    ((=number? a2 0) 1)
    ((=number? a2 1) a1)
    (else (list '** a1 a2))))
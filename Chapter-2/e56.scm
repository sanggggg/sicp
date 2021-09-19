(define (deriv exp var)
  (cond
    ((number? exp) 0)
    ((variable? exp) 
      (if (same-variable? exp var) 1 0))
    ((sum? exp)
      (make-sum (deriv (addend exp) var) (deriv (augend exp) var)))
    ((product? exp)
      (make-sum
        (make-product (multiplier exp) (deriv (multiplicand exp) var))
        (make-product (deriv (multiplier exp) var) (multiplicand exp) )))
    ((exponentiation? exp)
      (make-product
        (exponent exp)
        (make-product
          (make-exponentiation (base exp) (- (exponent exp) 1))
          (deriv (base exp)))))
    (else (error "asdf"))))

(define (exponentitation? exp)
  (and (pair? exp) (eq? (car x) '**)))

(define (make-exponentiation a1 a2)
  (cond
    ((=number? a2 0) 1)
    ((=number? a2 1) a1)
    (else (list '** a1 a2))))

(define (base exp) (cadr exp))

(define (exponent exp) (caddr exp))

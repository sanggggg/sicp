(define (make-sum . a)
  (cond
    ))

(define (augend exp) 
  (let ((remain (cddr exp))) 
    (if (= (length remain) 1) 
      (car remain) 
      (cons '+ remain)))) 
  
(define (multiplicand exp) 
  (let ((remain (cddr exp))) 
    (if (= (length remain) 1) 
      (car remain) 
      (cons '* remain)))) 
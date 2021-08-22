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

(display (fold-right / 1 (list 1 2 3)))
(newline)
(display (fold-left / 1 (list 1 2 3)))
(newline)
(display (fold-right list (list) (list 1 2 3)))
(newline)
(display (fold-left list (list) (list 1 2 3)))
;; 결합법칙과 교환법칙이 성립해야 한다.
;; 교환법칙의 경우 fold-left 와 fold-right의 op 연산 순서를 어떻게 하느냐에 따라 성립하지 않아도 같은 결과를 나올 수 있게 만들 수 있다.


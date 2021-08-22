(define (subsets s)
  (if (null? s)
    (list (list))
    (let ((rest (subsets (cdr s))))
      (append rest (map (lambda (i) (cons (car s) i)) rest))
    )
  )
)

(display (subsets (list 1 2 3 4)))

;; x 의 멱집합 X는 x의 임의의 원소 a 를 제외한 집합 x' 의 멱집합 X' 의 각 원소에 대해 a 와 합집합 시킨 집합 X" 에 대해 
;; X = union(X', X") 로 정의할 수 있다. 공집합의 멱집합은 공집합임을 활용해 초항을 만들어 줄 수 있다.
;; 이를 재귀적으로 구현한 것이 위 코드이다.
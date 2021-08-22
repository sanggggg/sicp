;; 1-29
;; Integral using Simpson's Rule
(define (integral-simpson f a b n)
  (define h (/ (- b a) n))
  (define (next n) (+ n (* h 2)))
  (* 
    (+
      (* (sum f (+ a (* 2 h)) next b) 2)
      (* (sum f (+ a (* 1 h)) next b) 4)
      (f a)
      (f b)
    )
    (/ h 3)
  )
)

;; 1-30
;; sum - recursive
(define (recur-sum term a next b)
  (if (> a b)
    0
    (+ (term a) (sum-rec term (next a) next b))
  )
)
;; sum - iterate
(define (iter-sum term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (+ result (term a)))
    )
  )
  (iter a 0)
)

;; 1-31
;; product - only iterate
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (* result (term a)))
    )
  )
  (iter a 1)
)

;; 1-32
;; accumulate - iterate
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
      result
      (iter (next a) (combiner result (term a)))
    )
  )
  (iter a null-value)
)

(define (sum term a next b)
  (accumulate + 0 term a next b)
)

(define (product term a next b)
  (accumulate * 1 term a next b)
)
(filtered-accumulate + 0 (lambda (x) (* x x)) 1 inc 20 prime?)

;; 1-33
;; filter accumulate
(define (filtered-accumulate combiner null-value term a next b predicate)
  (define (iter a result)
    (if (> a b)
      result
      (if (predicate a)
        (iter (next a) (combiner result (term a)))
        (iter (next a) result)
      )
    )
  )
  (iter a null-value)
)

;; sum of squared primes between [a, b]
(define (sum-squared-primes a b)
  (filtered-accumulate + 0 (lambda (x) (* x x)) a (lambda (x) (+ x 1)) b prime?)
)


;; product of number coprime with N between [0, N]
(define (product-coprime N)
  (define (check-coprime-n x)
    (= gcd(x, N) 1)
  )
  (filtered-accumulate * 1 (lambda (x) (x)) 0 (lambda (x) (+ x 1)) (- N 1) check-coprime-n)
)

;; 1.34
error thrown: argument type not matched (f should called with function, but f called with 2)


;; 1.35
;; find golden ratio
(fixed-point (lambda (x) (+ 1 (/ 1 x))) 2.0)
-> 1.6180327868852458
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance)
  )
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next)
      )
    )
  )
  (try first-guess)
)

;; 1.36
;;
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance)
  )
  (newline)
  (display guess)
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
        next
        (try next)
      )
    )
  )
  (try first-guess)
)

> (fixed-point (lambda (x) (/ (log 1000) (log x))) 5)
5
4.29202967422018
4.741863119908242
4.438204569837609
4.635299887107611
4.50397811613643
4.589989462723705
4.53301150767844
4.570475672855484
4.545720389670642
4.562024936588171
4.551263234080531
4.55835638768598
4.553676852183342
4.55676216434628
4.554727130670954
4.556069054770006
4.555184018843625
4.5557676565438205
4.555382746639082
4.55563658243586
4.555469180245326
4.555579577900997
4.5555067722873686
4.5555547860484085
4.555523121789556
4.555544003742869
4.555530232469306
4.555539314360711


> (fixed-point (lambda (x) (average x (/ (log 1000) (log x)))) 5)
5
4.64601483711009
4.571611286076025
4.558294317536066
4.556006022881116
4.555615799731297
4.555549342575593
4.555538027101999
4.5555361005218895

;; 1.37
;; continued fraction
(define (cont-frac n d k)
  (define (iter i result)
    (if (< i 1)
      result
      (iter (- i 1) (/ (n i) (+ result (d i))))
    )
  )
  (iter k 0)
)
real value (1 / golden ratio): 0.618033989

> (cont-frac (lambda (i) 1.0) (lambda (i) 1.0) 11)
0.6180555555555556

;; 1.38
(cont-frac 
  (lambda (i) 1.0) 
  (lambda (i) 
    (if (= (remainder (+ i 1) 3) 0)
      (* (/ (+ i 1) 3) 2)
      1
    )
  ) 
  11
)

;; 1.39
(define (tan-cf x k)
  (neg
    (cont-frac
      (lambda (i) 
        (if (= i 1)
          (neg x)
          (neg (* x x))))
      (lambda (i) (- (* i 2) 1)) 
      k
    )
  )
)

;; 1.40
(define (cubic a b c)
  (lambda (x)
    (+ 
      (* x x x)
      (* a x x)
      (* b x)
      c
    )
  )
)

;; 1.41
(define (double f)
  (lambda (x) (f (f x)))
)
21

;; 1.42
(define (compose f g)
  (lambda (x) (f (g x)))
)

;; 1.43
(define (repeated f n)
  (if (> n 1)
    (compose f (repeat f (- n 1)))
    f
  )
)

;; 1.44
(define (smooth f)
  (lambda (x)
    (/ 
      (+  
        (f (- x dx))
        (f x)
        (f (+ x dx))
      )
      3
    )
  )
)

(repeated (smooth f) n)


;; 1.45
(define (average-damp f)
  (lambda (x)
    (/ (+ x (f x)) 2)
  )
)

(define (fraction-n n k)
  (if (> n 1)
    (lambda (x) (/ ((fraction-n (- 1 n) k) x) x))
    (lambda (x) (* k (/ 1 x)))
  )
)

(define (nth-root x n)
  (fixed-point
    (
      (repeated average-damp (floor (log n 2)))
      (fraction-n (- n 1) x)
    )
    1.0
  )
)


;; 1.46
(define (iterative-improve check-guess get-next)
  (define (iter guess)
    (if (check-guess guess)
      guess
      (iter (get-next guess))
    )
  )
  (lambda (guess) (iter guess))
)


(define (fixed-point f first-guess)
  (define (close-enough? guess)
    (< (abs (- guess (f guess))) tolerance)
  )
  ((iterative-improve
    close-enough?
    f
  ) first-guess)
)

(define (sqrt x)
  (define (close-enough? guess)
    (< (abs (- x (* guess guess))) tolerance)
  )
  (define (improve guess)
    (/ (+ guess (/ x guess)) 2)
  )
  ((iterative-improve
    close-enough?
    improve
  ) 1.0)
)

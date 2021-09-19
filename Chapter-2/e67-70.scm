(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x) (cadr x))

(define (weight-leaf x) (caddr x))

(define (left-branch tree) (car tree))

(define (right-branch tree) (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
    (list (symbol-leaf tree))
    (caddr tree)))

(define (contains symbol symbols)
  (cond
    ((null? symbols) false)
    ((eq? (car symbols) symbol) true)
    (else (contains symbol (cdr symbols)))))

(define (weight tree)
  (if (leaf? tree)
    (weight-leaf tree)
    (cadddr tree)))

(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (adjoin-set x set)
  (cond ((null? set) (list x))
        ((< (weight x) (weight (car set))) (cons x set))
        (else (cons (car set) (adjoin-set x (cdr set))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
    '()
    (let ((pair (car pairs)))
      (adjoin-set (make-leaf (car pair) (cadr pair))
                  (make-leaf-set (cdr pairs))))))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit"))))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
      '()
      (let ((next-branch (choose-branch (car bits) current-branch)))
        (if (leaf? next-branch)
          (cons (symbol-leaf next-branch)
                (decode-1 (cdr bits) tree))
          (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define sample-tree
  (make-code-tree
    (make-leaf 'A 4)
    (make-code-tree
      (make-leaf 'B 2)
      (make-code-tree
        (make-leaf 'D 1)
        (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(decode sample-message sample-tree)
;; ADABBCA

(define (encode-symbol symbol tree)
  (cond
    ((leaf? tree)
      (if (eq? (symbol-leaf tree) symbol)
        '()
        (error "not found" symbol)))
    ((contains symbol (symbols (left-branch tree)))
      (cons '0 (encode-symbol symbol (left-branch tree))))
    ((contains symbol (symbols (right-branch tree)))
      (cons '1 (encode-symbol symbol (right-branch tree))))
    (else (error "not found" symbol  (symbols (left-branch tree))  (symbols (right-branch tree)) (contains symbol (symbols (right-branch tree)))))))

(define (encode message tree)
  (if (null? message)
    '()
    (append (encode-symbol (car message) tree)
            (encode (cdr message) tree))))

(encode '(A D A B B C A) sample-tree)


(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge set)
  (if (< (length set) 2)
    (car set)
    (let ((merged (make-code-tree (car set) (cadr set))))
      (successive-merge
        (adjoin-set merged (cddr set))))))

(define rock-song-tree
  (generate-huffman-tree 
    '(
      (A 2)
      (BOOM 1)
      (GET 2)
      (JOB 2)
      (NA 16)
      (SHA 3)
      (YIP 9)
      (WAH 1))))

(define rock-song '(GET A JOB SHA NA NA NA NA NA NA NA NA GET A JOB SHA NA NA NA NA NA NA NA NA WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP SHA BOOM))

(define encoded-rock-song (encode rock-song rock-song-tree))

(length encoded-rock-song)
;; huffman coded bits : 84
;; origin bits (each letter use 3 bits for 8 unique words) : 108


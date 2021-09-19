;; each non leaf node have 1 child on left
;; bits for most frequent letter: 1 bit * (2 ^ (n - 1)) times = 2 ^ (n - 1) bits
;; bits for least frequent letter: (n - 1) bit * 1 times = (n - 1) bits
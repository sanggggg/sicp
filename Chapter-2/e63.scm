;; a. same result
;; b.
;; tree->list-1 Time complexity
;;   T(N) = 2 * T(N / 2) + O(N / 2)
;;   *O(N / 2) for compute append function
;;   T(N) -> O(N log N)
;; tree->list-2 Time complexity
;;   T(N) = 2 * T(N / 2) + O(1)
;;   T(N) -> O(N)

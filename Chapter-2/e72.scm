;; O(N) = N
;; T(N) = min(Nt, N - Nt) + T(Nt), No for child node symbol length which contains target
;; worst case, every No in each calculation step is bigger then N / 2
;; T(N) = N - Nt + (Nt - Ntt + (Ntt - Nttt) ...)
;;      = N
;; time complexity = O(N)
;;
;; time to encode most frequent letter : 1 (time for checking left node containing MFL)
;;   1
;; time to encode least frequent letter : N
;;   (time for checking left node not containing LFL) * (depth of tree)
;;   1 * N = N
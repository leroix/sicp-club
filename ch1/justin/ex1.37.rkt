#lang racket

;; Requires 11 iterations to obtain accuracy to 4 decimal places
(define (recur-frac i n d k)
  (cond ((= i (- k 1)) (/ (n k) (d k)))
        (else (/ (n i) (+ (d i) (recur-frac (+ i 1) n d k))))))

;; this is the tail-recursive version
(define (iter-frac s n d k)
  (cond ((= k 0) s)
        (else (iter-frac (/ (n (- k 1)) (+ (d (- k 1)) s)) n d (- k 1)))))

;; k is the number of iterations so subtract 1 because we're 0-indexing
(define (cont-frac n d k)
  ;(recur-frac 0 n d k))
  (iter-frac (/ (n k) (d k)) n d (- k 1)))
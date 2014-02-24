#lang racket

(define (even? n)
  (= (remainder n 2) 0))

(define (square x) (* x x ))

(define (iter-expt a b n)
  (cond ((= n 0) a)
        ((even? n) (iter-expt a (square b) (/ n 2)))
        (else (iter-expt (* b a) b (- n 1)))))

(define (fast-expt b n)
  (iter-expt 1 b n))
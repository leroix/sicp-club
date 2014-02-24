#lang racket

(define (iterate guess good? improve)
  (cond ((good? guess) guess)
        (else (iterate (improve guess) good? improve))))

(define (iterative-improve good? improve)
  (lambda (guess) (iterate guess good? improve)))


(define (square x) (* x x))
(define (average x y) (/ (+ x y) 2))

;; sqrt functions
(define (good-sqrt? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve-sqrt guess x)
  (average (/ x guess) guess))

(display "Square root of 2:\t")
((iterative-improve 
  (lambda (gss) (good-sqrt? gss 2)) 
  (lambda (gss) (improve-sqrt gss 2))) 1.0)

;; fixed point functions
(define (good-fp? guess f)
  (< (abs (- guess (f guess))) 0.00001))

(display "Fixed point of cos(x):\t")
((iterative-improve (lambda (g) (good-fp? g cos)) cos) 1.0)
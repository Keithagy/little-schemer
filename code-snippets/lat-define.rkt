#lang racket

(provide atom?)
(define (atom? x)
  (and (not (null? x))
       (not (pair? x))))

; This is a sample implementation of `lat?`
(define (lat? l)
    (cond
        ((null? l) #t)
        ((atom? (car l)) (lat? (cdr l)))
        (else #f)
    )
)

; Another way to implement `lat?`, to list recursion base cases up top
(
    define (lat2? l) (
        cond
            ((null? l) #t)
            ((not (atom? (car l))) #f)
            (else (lat2?(cdr l)))
    )
)
(lat? '(bacon and eggs))
(lat? '((bacon) and eggs))
(lat2? '(bacon and eggs))
(lat2? '((bacon) and eggs))

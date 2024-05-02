#lang racket

(define (member? a lat)(
   cond
    ((null? lat) #f)
    (else (or(eq? a (car lat)) (member? a (cdr lat))))
    ))

(member? 'bacon '(bacon and eggs))
(member? 'and '(bacon and eggs))
(member? 'dog '(bacon and eggs))
(member? 'dog '())

#lang racket

(define (rember1 a lat) (
    remberInner a '() lat
    ))
; it's the outermost parentheses that binds the executions to the function name...
(define (remberInner a newList lat)
  (cond
    ((null? lat) newList)
    ; ((eq? a (car lat)) (remberInner a newList (cdr lat))) >> would remove every instance of a
    ((eq? a (car lat)) (append (cdr lat) newList))
    (else (remberInner a (cons (car lat) newList) (cdr lat)))))


(define (rember2 a lat)
    (
        cond
        ((null? lat) '())
        (else (
            cond
            ; ((eq? a (car lat)) (rember2 a (cdr lat))) >> this would remove every instance of a
            ((eq? a (car lat)) (cdr lat))
            (else (cons (car lat) (rember2 a (cdr lat))))
            )
            )
        )
    )

; note that rember1 reverses the order of `lat`, since it evaluates the cons call prior to recursion
; change input prior to recursion gives stack semantics (reverses order of inputs)
; change input post-recursion gievs queue semantics (preserves order of inputs)
(rember1 'and '(bacon lettuce and tomato))
(rember2 'and '(bacon lettuce and tomato))

(rember1 'and '(bacon and lettuce and tomato))
(rember2 'and '(bacon and lettuce and tomato))

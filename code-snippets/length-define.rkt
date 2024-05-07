#lang racket
(require rackunit)
(require rackunit/text-ui)

(define length (lambda (lat) (
    cond
    ((null? lat) 0)
    (else (+ 1 (length (cdr lat))))
    )
))


(define length-tests
    (test-suite "length"
        (test-case "empty list"
            (check-eq?
                (length '())
                0
                )
            )
        (test-case "single element"
            (check-eq?
                (length '(a))
                1
                )
            )
        (test-case "five elements"
            (check-eq?
                (length '(a b c 1 5))
                5
                )
            )
        )
    )

(run-tests length-tests)

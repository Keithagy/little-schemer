#lang racket
(require rackunit)
(require rackunit/text-ui)

(define (insertL new old lat)
    (
        cond
        ((null? lat) '())
        ((eq? old (car lat)) (cons new lat))
        (else (cons (car lat) (insertL new old (cdr lat))))
        )
    )

(define insertL-tests
    (test-suite "insertL"
        (test-case "basic"
            (check-equal?
                (insertL
                    'topping
                    'fudge
                    '(ice cream with fudge for dessert)
                    )
                '(ice cream with topping fudge for dessert)
                )
            )
        (test-case "basic-2"
                (check-equal?
                    (insertL
                        'jalapeno
                        'and
                        '(tacos tamales and salsa)
                        )
                    '(tacos tamales jalapeno and salsa)
                    )
                )
        (test-case "insert-at-first-occurence"
                    (check-equal?
                        (insertL
                            'e
                            'd
                            '(a b c d f g d h)
                            )
                        '(a b c e d f g d h)
                        )
                    )
        )
    )
(run-tests insertL-tests)

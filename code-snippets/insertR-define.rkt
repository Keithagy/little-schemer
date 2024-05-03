#lang racket
(require rackunit)
(require rackunit/text-ui)

(define (insertR new old lat)
    (
        cond
        ((null? lat) '())
        ((eq? old (car lat)) (cons old (cons new (cdr lat))))
        (else (cons (car lat) (insertR new old (cdr lat))))
        )
    )

(define insertR-tests
    (test-suite "insertR"
        (test-case "basic"
            (check-equal?
                (insertR
                    'topping
                    'fudge
                    '(ice cream with fudge for dessert)
                    )
                '(ice cream with fudge topping for dessert)
                )
            )
        (test-case "basic-2"
                (check-equal?
                    (insertR
                        'jalapeno
                        'and
                        '(tacos tamales and salsa)
                        )
                    '(tacos tamales and jalapeno salsa)
                    )
                )
        (test-case "insert-at-first-occurence"
                    (check-equal?
                        (insertR
                            'e
                            'd
                            '(a b c d f g d h)
                            )
                        '(a b c d e f g d h)
                        )
                    )
        )
    )
(run-tests insertR-tests)

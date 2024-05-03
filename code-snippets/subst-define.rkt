#lang racket
(require rackunit)
(require rackunit/text-ui)

(define (subst new old lat)
    (
        cond
        ((null? lat) '())
        ((eq? old (car lat)) (cons new (cdr lat)))
        (else (cons (car lat) (subst new old (cdr lat))))
        )
    )

(define (subst2 new o1 o2 lat)
    (
        cond
        ((null? lat) '())
        ((or (eq? o1 (car lat)) (eq? o2 (car lat))) (cons new (cdr lat)))
        (else (cons (car lat) (subst2 new o1 o2 (cdr lat))))
        )
    )

(define subst-tests
    (test-suite "subst"
        (test-case "basic"
            (check-equal?
                (subst
                    'topping
                    'fudge
                    '(ice cream with fudge for dessert)
                    )
                '(ice cream with topping for dessert)
                )
            )
        (test-case "basic-2"
                (check-equal?
                    (subst
                        'jalapeno
                        'and
                        '(tacos tamales and salsa)
                        )
                    '(tacos tamales jalapeno salsa)
                    )
                )
        (test-case "insert-at-first-occurence"
                    (check-equal?
                        (subst
                            'e
                            'd
                            '(a b c d f g d h)
                            )
                        '(a b c e f g d h)
                        )
                    )
        )
    )

(define subst2-tests
    (test-suite "subst2"
        (test-case "basic"
            (check-equal?
                (subst2
                    'vanilla
                    'chocolate
                    'banana
                    '(banana ice cream with chocolate topping)
                    )
                '(vanilla ice cream with chocolate topping)
                )
            )
        (test-case "basic-2"
                    (check-equal?
                        (subst2
                            'vanilla
                            'chocolate
                            'banana
                            '(chocolate banana ice cream with chocolate topping)
                            )
                        '(vanilla banana ice cream with chocolate topping)
                        )
                    )
        )
    )
(run-tests subst-tests)
(run-tests subst2-tests)

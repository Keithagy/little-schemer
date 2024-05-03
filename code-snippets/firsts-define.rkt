#lang racket
(require rackunit)
(require rackunit/text-ui)
(require "lat-define.rkt")

#|
    The Third Commandment

    When building a list, describe the first typical element,
    then `cons` it onto the natural recursion.
|#
(define (firsts l)
    (
        cond
        ((null? l) '())
        ((atom? (car l)) (error "Input should be a list of lists"))
        (else (cons (car (car l)) (firsts (cdr l))))
        )
    )

(define firsts-tests
    (test-suite "firsts"
        (test-case "must-be-list-of-lists"
              (check-exn exn:fail? (lambda () (firsts '(apple plum grape bean)))))
        (test-case "same-length"
            (check-equal?
                (firsts
                    '(
                        (apple peach pumpkin)
                        (plum pear cherry)
                        (grape raisin pea)
                        (bean carrot eggplant)
                        )
                    )
                '(apple plum grape bean)
                )
            )
        (test-case "same-length-2"
                (check-equal?
                    (firsts
                        '(
                            (a b)
                            (c d)
                            (e f)
                            )
                        )
                    '(a c e)
                    )
                )
        (test-case "null-list"
                    (check-equal?
                        (firsts '())
                        '()
                        )
                    )
        (test-case "different-lengths"
                    (check-equal?
                        (firsts
                            '(
                                (five plums)
                                (four)
                                (eleven green oranges)
                                )
                            )
                        '(five four eleven)
                        )
                    )
        (test-case "nested-inputs"
                        (check-equal?
                            (firsts
                                '(
                                    ((five plums) four)
                                    (eleven green oranges)
                                    ((no) more)
                                    )
                                )
                            '((five plums) eleven (no))
                            )
                        )
        )
    )
(run-tests firsts-tests)

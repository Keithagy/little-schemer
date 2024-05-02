#lang racket

;'•abc$ ; Valid atom, because not open or close parenthesis
;'(atom); ( and ) start and end a list respectively
;'(atom turkey or); this is a list with 3 atoms
;'(atom turkey) or >> this is not a list. This is 2 s-expressions. First is list containing 2 atoms, second one is an atom.
;'xyz ; all atoms are S-expressions,
;'(x y z); and so are lists
;(car '(a b c)) ; car operator acts on a non-empty list only (pass it to the operator as a quote), and returns its first element (an S-expression)
;(car '()) ; gives an error, since the list is empty. the primitive car is defined only for non-empty lists

#| In Racket, the `'` character (known as the single quote or the quote character) is used to create a quoted S-expression. It has a special meaning in the language and is used to prevent the evaluation of an S-expression.

When you prefix an S-expression with the quote character, Racket treats it as a literal value rather than evaluating it. In other words, the quoted S-expression is not evaluated according to the normal evaluation rules but is instead treated as data.

Here are a few examples to illustrate the significance of the quote character:

1. Quoting symbols:
   - `'a` is treated as the symbol `a`, rather than evaluating it as a variable reference.
   - `(define x 10)` binds the value `10` to the variable `x`, while `'x` is simply the symbol `x`.

2. Quoting lists:
   - `'(a b c)` is treated as a list containing the symbols `a`, `b`, and `c`, rather than evaluating it as a function call.
   - `(+ 1 2)` evaluates to `3`, while `'(+ 1 2)` is a list containing the symbol `+` and the numbers `1` and `2`.

3. Quoting expressions:
   - `(let ([x 5]) (* x 2))` evaluates to `10`, while `'(let ([x 5]) (* x 2))` is a list representing the `let` expression itself.

The quote character is commonly used in Racket (and other Lisp-based languages) for several purposes:
- To create literal lists and symbols as data structures.
- To prevent the evaluation of expressions when you want to manipulate them as data (e.g., in macros or meta-programming).
- To specify the structure of an abstract syntax tree (AST) in a readable and concise way.

It's important to note that the quote character is a shorthand for the `quote` special form in Racket. So, `'expr` is equivalent to `(quote expr)`.

Understanding the role of the quote character is crucial when working with Racket, as it allows you to differentiate between expressions that should be evaluated and those that should be treated as literal data.
|#

(cons "peanut" '(butter and jelly)); cons constructs a list from the 2 provided arguments, where first is the car and second is the cdr
(string? 'peanut)
(symbol? 'peanut)
(null? 'atom)
(lat? 'atom)

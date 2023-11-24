# Ten Commandments of Scheme

1. When recurring on a list of atoms, `lat`, ask two questions about it: `(null? lat)` and `else`.
   When recurring on a number, `n` ask two questions about it: `(zero? n)` and `else`.
   When recurring on a list of S-expressions, `l`, ask three questions about it: `(null? l)`, `(atom? (car l))` and `else`.
2. Use `cons` to build lists.
3. When building a list, describe the first typical element, and then `cons` it onto the natural recursion.
4. Always change at least one argument while recurring.
   When recurring on a list of atoms, `lat`, use `(cdr lat)`.
   When recurring on a number, `n`, use `(sub1 n)`.
   And when recurring on a list of S-expressions, `l`, use `(car l)` and `(cdr l)` if neither `(null? l)` nor `(atom? (car l))` are true.

   It must be changed to be closer to termination. The changing argument must be tested in the termination condition:
   When using `cdr`, test termination with `null?` and
   When using `sub1`, test termination with `zero?`.

5. When building a value with `+`, always use `0` for the value of the terminating line, for adding `0` does not change the value of an addition.
   When building a value with `x`, always use `1` for the value of the terminating line, for multiplying by `1` does not change the value of a multiplication.
   When building a value with cons, always consider `()` for the value of the terminating line.
6. Simplify only after the function is correct.
7. Recur on the `subparts` that are of the same nature:
   - On the sublists of a list
   - On the subexpressions of an arithmetic expression.
8. Use help functions to abstract from representations.
9. Abstract common patterns with a new function.
10. Build functions to collect more than one value at a time.

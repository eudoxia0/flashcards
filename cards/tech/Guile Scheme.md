C: Function: [`display`]

Synopsis: [print a string to stdout.]

---

Q: True constant.
A: `#t`

---

Q: False constant.
A: `#f`

---

Q: Define a variable `v` with an initial value `e`.
A: `(define v e)`

---

C: Function: [`string-append`]

Synopsis: [concatenate strings.]

---

Q: Define a function `square` that returns the square of its input.
A:
```
(define (square x)
  (* x x))
```

---

C: Function: [`string?`]

Synopsis: [predicate to test if a value is a string.]

---

C: Function: [`eq?`]

Synopsis: [pointer equality.]

---

C: Function: [`equal?`]

Synopsis: [value equality.]

---

C: Function: [`member`]

Synopsis: [test if an element is part of a list.]

---

Q: Evaluate: `(member 'a '(a b c))`
A: `(a b c)`

---

Q: Evaluate: `(member 'b '(a b c))`
A: `(b c)`

---

Q: Evaluate: `(member 'z '(a b c))`
A: `#f`

---

Q: Nil constant.
A: `'()`

---

C: Function: [`string-length`]

Synopsis: [return the length of a string.]

---

C: Function: [`symbol->string`]

Synopsis: [convert a symbol to a string.]

---

Q: Evaluate: `(symbol->string 'foo)`
A: `"foo"`

---

C: Function: [`string-upcase`]

Synopsis: [convert a string to uppercase.]

---

Q: Evaluate: `(string-upcase "foo")`
A: `"FOO"`

---

C: Syntax: [`(map f l)`]

Description: [apply `f` to each element of a list `l`, and return the list of results.]

---

C: Function: [`=`]

Synopsis: [numerical equality.]

---

C: Syntax: [`(set! v e)`]

Description: [assign the value `e` to the variable `v`.]

---

C: Syntax: [`(begin e0 e1 ... en)`]

Description: [evaluate expressions `e0`, `e1`, ..., `en` in order, returning the value of `en`.]

---

Q: Scheme equivalent of Common Lisp's `progn`.
A: `begin`

---

C: Syntax: [`(vector e0 e1 ... en)`]

Description: [construct a vector given initial elements `e0`, `e1`, ..., `en`.]

---

C: Function: [`vector`]

Synopsis: [vector constructor.]

---

C: Syntax: [`(vector-ref v i)`]

Description: [return the `i`-th element of a vector `v`.]

---

C: Syntax: [`(vector-set! v i e)`]

Description: [store `e` as the value of the `i`-th element of a vector `v`.]

---

C: Function: [`string=?`]

Synopsis: [string equality.]

---

C: Function: [`newline`]

Synopsis: [print a newline to stdout.]

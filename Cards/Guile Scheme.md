C:
Function: [`display`]

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

C:
Function: [`string-append`]

Synopsis: [concatenate strings.]

---

Q: Define a function `square` that returns the square of its input.
A:
```
(define (square x)
  (* x x))
```

---

C:
Function: [`string?`]

Synopsis: [predicate to test if a value is a string.]

---

C:
Function: [`eq?`]

Synopsis: [pointer equality.]

---

C:
Function: [`member?`]

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

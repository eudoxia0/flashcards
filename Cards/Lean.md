Q: File extension.
A: `.lean`

---

Q: Type specifier, booleans.
A: `Bool`

---

Q: True constant.
A: `true`

---

Q: False constant.
A: `false`

---

Q: Type specifier, natural numbers.
A: `Nat`

---

Q: Type specifier, integers.
A: `Int`

---

Q: Type specifier, strings.
A: `String`

---

Q: Syntax: assert that expression `e` has type `t`.
A: `(e : t)`

---

Q: Syntax: evaluate an expression `e` and print its value.
A: `#eval e`

---

Q: Syntax: check that an expression `e` has type `t`, without evaluating it.
A: `#check (e : t)`

---

Q: Syntax: define a variable `v` of type `t`, with a value `e`.
A: `def v: t := e`

---

Q: Define a function `sq` that returns the square of a natural number.
A: `def sq (n: Nat): Nat := n * n`

---

Q: Keyword for structure declarations.
A: `structure`

---

Q: Define a structure `Coord` with fields `x`, `y` of type `Float`.
A:
```
structure Coord where
    x : Float
    y : Float
```

---

Q: Syntax: structure literal assigning a singleton field `x` a value of `e`.
A: `{ x := e }`

---

Q: Syntax: update a struct `s` so that field `x` has a new value `e`.
A: `{ s with x := e }`

---

Q: Why are recursive sum types called inductive data types?
A: Because mathematical induction can be used to prove theorems about them.

---

Q: Keyword for inductive datatype declarations.
A: `inductive`

---

Q: Define the `Bool` type.
A:
```
inductive Bool where
    true : Bool
    false: Bool
```

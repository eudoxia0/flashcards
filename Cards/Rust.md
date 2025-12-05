Q: Consider this destructure expression:

```
let Foo { a, b } = foo;
```

How do you ignore field `a` specifically?

A:

```
let Foo { a: _, b } = foo;
```

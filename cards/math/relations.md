---
name = "Relations"
---

T: reflexive
D: $\forall x . R(x,x)$

---

T: irreflexive
D: $\forall x . \neg R(x,x)$

---

T: symmetric
D: $\forall x,y . R(x,y) \to R(y,x)$

---

T: asymmetric
D: $\forall x,y . R(x,y) \to \neg R(y,x)$

---

T: transitivity
D: $\forall x,y,z . R(x,y), R(y,z) \to R(x,z)$

---

T: connected relation
D: a relation $R$ where $\forall x, y . x \neq y \to R(x,y) \lor R(y,x)$

---

Q: Let $R$ be an equivalence relation on $A$, and $x \in A$. Notation for the equivalence class of $x$?
A: $[x]_R$

---

Q: Let $R$ be an equivalence relation on $A$, and $x \in A$. Define the equivalence class of $x$.
A: $\set{ y \in A : R(x,y) }$

---

T: antisymmetric
D: a relation where two distinct elements cannot be linked bidirectionally.

---

Q: A relation $R$ is called antisymmetric when:

$R(x,y) \land R(y,x) \implies \ldots$

A: $x=y$

---

Q: Let $R$ be a relation where:

$$R(x,y) \land R(y,x) \implies x=y$$

What is $R$ called?

A: Antisymmetric.

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

T: antisymmetric
D: $\forall x,y . R(x,y) \land R(y,x) \to x=y$

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

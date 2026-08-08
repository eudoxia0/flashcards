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

C: A relation is [antisymmetric] if distinct elements can only be related in one direction.

---

T: transitivity
D: $\forall x,y,z . R(x,y), R(y,z) \to R(x,z)$

---

T: connected relation
D: a relation $R$ where $\forall x, y . x \neq y \to R(x,y) \lor R(y,x)$

---

T: equivalence relation
D: a relation that is reflexive, symmetric, and transitive.

---

Q: Let $R$ be an equivalence relation on $A$, and $x \in A$. Notation for the equivalence class of $x$?
A: $[x]_R$

---

Q: Let $R$ be an equivalence relation on $A$, and $x \in A$. Define the equivalence class of $x$.
A: $\set{ y \in A : R(x,y) }$

---

T: preorder
D: a relation that is both reflexive and transitive.

---

T: partial order
D: a preorder which is also antisymmetric.

---

T: total order
D: a partial order that is also connected.

---

T: strict order
D: a relation which is irreflexive, asymmetric, and transitive.

---

T: strict total order
D: a strict order that is also connected.

---

C: We can turn a preorder into a partial order by adding [antisymmetry].

---

C: We can turn a partial order into a total order by adding [connectedness].

---

C: We can turn a strict order into a strict total order by adding [connectedness].

---

Q: Conceptually, what do we gain by going from a preorder to a partial order?
A: All distinct elements must be separable by the relation.

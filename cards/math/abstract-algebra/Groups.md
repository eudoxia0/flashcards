---
name = "Group Theory"
---

T: group
D: a mathematical object made up of a set $S$, an associative binary operation $S \times S \to S$, and identity $e \in S$, and an inverse $a^{-1}$ for each $a \in S$.

---

C: A group without inverses is called a [monoid].

---

C: The **order** of a group $G$, denoted [$|G|$], is [the number of elements it contains].

---

T: Abelian group
D: a group whose operation is commutative.

---

T: order of an element
D: given $g \in G$, the smallest positive integer $r$ such that $g^r=e$.

---

C: Theorem: [Lagrange's theorem]

Statement: [if $H \subseteq G$ and $G$ is finite, then $|H|$ divides $|G|$.]

---

Q: Let $H \subset G$. Given $g \in G$, define the left coset of $H$ in $G$ determined by $g$.
A: $$gH = \set{ gh | h \in H }$$

---

Q: Let $H \subset G$. Given $g \in G$, define the right coset of $H$ in $G$ determined by $g$.
A: $$Hg = \set{ hg | h \in H }$$

---

T: matrix group
D: a set of square matrices that satisfy the group properties under matrix multiplication.

---

T: group representation
D: a function that maps a group to a matrix group in a way that preserves products.

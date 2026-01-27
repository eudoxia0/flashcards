Q: Notation for the inner product of two vectors $a$ and $b$.
A: $\langle a, b \rangle$

---

Q: Signature of the inner product $\langle \cdot, \cdot \rangle$ in a vector space $V$ over a field $\mathbb{F}$.
A: $$\langle \cdot, \cdot \rangle : V \times V \to \mathbb{F}$$

---

Q: Define the norm of a vector $v$ using the inner product.
A: $$||v|| = \sqrt{\langle v, v \rangle}$$

---

C: Term: [skew-symmetric matrix]

Definition: [a square matrix whose transpose equals its negation.]

---

C:

Let $A$ be a matrix. Then:

[$\text{SkewSymmetric}(A)$] $\iff$ [$A^T = -A$]

---

C: If a matrix $A$ satisfies $A^T = -A$, it is termed [skew-symmetric].

---

C: A matrix $A$ is termed skew-symmetric when it satisfies the equation $A^T = -A$.

---

Q: In a skew-symmetric matrix, the elements of the diagonal are all zeroes. Why?
A: Because zero is the only number that satisfies $a=-a$.

---

Q: Define symplectic matrix.
A: A symplectic matrix $A$ is a $2n \times 2n$ matrix that satisfies:

$$
A^A \Omega A = \Omega
$$

where $\Omega$ is a fixed $2n \times 2n$ invertible skew-symmetric matrix.

---

Q: Let $A$ be a $2n \times 2n$ matrix that satisfies:

$$
A^A \Omega A = \Omega
$$

where $\Omega$ is a fixed $2n \times 2n$ invertible skew-symmetric matrix. What is the term for $A$?

A: Symplectic.

---

Q: Let $\mathcal{P}_n$ be the Pauli group for $n$ qubits. How many operators in $\mathcal{P}_n$?
A: $4^{n+1}$

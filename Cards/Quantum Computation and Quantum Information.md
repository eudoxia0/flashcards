Q: Unitarity means a quantum logic gate is always reversible. Why?
A: The inverse of a unitary matrix is another unitary matrix; therefore, every quantum logic gate has an inverse gate that reverses its action.

---

Q: Notation for a generic unitary matrix.
A: $U$

---

Q: Notation for the Hadamard gate.
A: $H$

---

C: The qubit state $\ket{0}$ is identified with the vector [$(1, 0)$].

---

C: The qubit state $\ket{1}$ is identified with the vector [$(0, 1)$].

---

C: The state of a qubit is a vector in a [two]-dimensional vector space whose field is [$\Complex$].

---

Q: Write the state of a qubit, $\ket{\psi}$, as a linear combination of its basis states.
A: $$\ket{\psi} = \alpha \ket{0} + \beta \ket{1}$$

---

C: Measuring the state of a qubit gives us the state [0] with probability $|\alpha|^2$.

---

C: Measuring the state of a qubit gives us the state [1] with probability $|\beta|^2$.

---

Q: Consider the state of a qubit:

$$\ket{\psi} = \alpha \ket{0} + \beta \ket{1}$$

What condition must $\alpha$ and $\beta$ satisfy, and why?

A: $|\alpha|^2 + |\beta|^2 = 1$, since the probability of observing 0 or 1 must sum to one.

---

C: The set $\set{\ket{0}, \ket{1}}$ forms an [orthonormal] basis for the state of a qubit.

---

Q: Consider the state of a qubit:

$$\ket{\psi} = \alpha \ket{0} + \beta \ket{1}$$

Geometrically, what is the interpretation of the constraint $|\alpha|^2 + |\beta|^2 = 1$?

A: $\ket{\psi}$ has unit length.

---

C: The [north] pole of the Bloch sphere is given to the vector [$\ket{0}$].

---

C: The [south] pole of the Bloch sphere is given to the vector [$\ket{1}$].

---

Q: What does it mean for a matrix $U$ to be unitary?
A: $U^\dagger U = I$

---

C: Let $A$ be a matrix. If $A^\dagger A = I$, then $A$ is said to be a [unitary] matrix.

---

Q: Let $A$ be a matrix. What does the notation $A^\dagger$ mean?
A: The conjugate transpose of $A$.

---

Q: Notation for the conjugate transpose of a matrix $A$.
A: $A^\dagger$

---

C: Term: [conjugate transpose]

Definition: [the operation that takes the transpose of the complex conjugate of a matrix.]

---

Q: What does CNOT stand for?
A: Controlled NOT.

---

Q: The CNOT gate has how many inputs.
A: Two.

---

Q: The CNOT gate has two inputs: what are they?
A: Control, target.

---

Q: What operation does the notation $\ket{a}\bra{b}$ represent?
A: Outer product.

---

C:
Notation: [$\braket{a|b}$]

Definition: [inner product of the vectors $\ket{a}$ and $\ket{b}$.]

---

C:
Notation: [$\ket{a} \otimes \ket{b}$]

Definition: [tensor product of the vectors $\ket{a}$ and $\ket{b}$.]

---

C:
Notation: [$\ket{a} \ket{b}$]

Definition: [abbreviated notation for the tensor product of the vectors $\ket{a}$ and $\ket{b}$.]

---

C:
Notation: [$\overline{A}$]

Definition: [complex conjugate of a matrix $A$.]

---

Q: How is the complex conjugate of a matrix defined?
A: Elementwise.

---

C:
Notation: [$\braket{a|A|b}$]

Definition: [inner product of $A^\dagger \ket{a}$ and $\ket{b}$.]

---

Q: Let $A$ be a matrix. Define the conjugate transpose $A^\dagger$ in symbols.
A: $$A^\dagger = (\overline{A})^T$$

---

C: Let $A$ be a linear operator in a finite-dimensional inner product space. The Hermitian adjoint is given by [$A^\dagger$.]

---

Q: Why can't we use a repetition code in quantum error correction?
A: Because of no-cloning.

---

Q: What does the Eastin–Knill theorem state?
A: No quantum error-correcting code can implement a universal gate set.

---

Q: Name of the theorem which states: no quantum error-correcting code can implement a universal gate set.
A: Eastin-Knill theorem.

---

C: Let $\ket{\psi}$ be a pure quantum state. A unitary matrix $U$ is said to [stabilize] the state $\ket{\psi}$ if [$U\ket{\psi}=\ket{\psi}$].

---

Q: Informally, what does it mean to say a unitary operator stabilizes a quantum state $\ket{\psi}$?
A: Applying that operator leaves the state unchanged.

---

Q: Let $\ket{\psi}$ be a quantum state, and $U$ and $V$ be stabilizers of $\ket{\psi}$. Then $UV$ is also a stabilizer of $\ket{\psi}$. Why?
A: $UV\ket{\psi} = U\ket{\psi} = \ket{\psi}$

---

Q: Notation for the stabilizer group of a quantum state $\ket{\psi}$.
A: $\text{Stab}(\ket{\psi})$

---

Q: What does the notation $\text{Stab}(\ket{\psi})$ mean?
A: The stabilizer group of $\ket{\psi}$.

---

Q: Let $\ket{\psi}$ be a quantum state, and $U$ a stabilizers of $\ket{\psi}$. Then $U^{-1}$ is also a stabilizer of $\ket{\psi}$. Why?
A:
$$
\begin{align*}
U\ket{\psi} &= \ket{\psi} \\
U^{-1}U\ket{\psi} &= U^{-1}\ket{\psi} \\
\ket{\psi} &= U^{-1}\ket{\psi} \\
U^{-1}\ket{\psi} &= \ket{\psi}
\end{align*}
$$

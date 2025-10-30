Q: Define termination of a rewrite system.
A: A rewrite system terminates when any expression can be rewritten into an expression for which no more rules apply.

---

C:
Term: [normal form]

Definition: [An expression for which no more rules apply.]

---

C: A term $x$ is [reducible] iff [there exists a $y$ such that $x \to y$].

---

C: Saying "$x$ is [irreducible]" is equivalent to saying "$x$ is a [normal form]".

---

C:
Notation: [$x!$]

Definition: [$x$ has a unique normal form.]

---

Q: Express "$x$ is an ancestor of $y$" symbolically.
A: $x \starpath y$

---

Q: Express "$x$ is a direct ancestor of $y$" symbolically.
A: $x \to y$

---

Q: Express "$y$ is a successor of $x$" symbolically.
A: $x \starpath y$

---

Q: Express "$y$ is a direct successor of $x$" symbolically.
A: $x \to y$

---

C: $x$ and $y$ are called [joinable] iff [there exists a $z$ such that $x \stackrel{+}{\rightarrow} z$ and $y \stackrel{+}{\rightarrow} z$].

---

C: Let $x$ and $y$ be terms. The notation [$x \join y$] means that $x$ and $y$ are [joinable].

---

Q: Define confluence in plain language.
A: If two terms have a common (possibly indirect) ancestor, they are joinable.

---

C:
[$\text{Confluent}(R)$]
$\iff$
[$\left( y_1 \lstarpath x \starpath y_2 \implies y_1 \join y_2 \right)$]

---

C:
Term: [convergent rewrite system]

Definition: [A rewrite system that is both terminating and confluent.]

---

C:
[$\text{ChurchRosser}(R)$]
$\iff$
[$\left( x \conv y \implies x \join y \right)$]

---

Q: Define the identity relation $R^0$ on a set $A$.
A: $$ R^0 = \set{(x,x) \mid x \in A} $$

---

Q: Rewrite $x \starpath y$ in Prolog notation.
A: $$ R^{\*}(x,y) $$

---

Q: How do you read $x \conv y$?
A: "$x$ and $y$ are convertible"

---

C:
Term: [normalizing rewrite system]

Definition: [A rewrite system where every element has at least one normal form.]

---

C:
[$\text{SemiConfluent}(R)$]
$\iff$
[$\left( y_1 \leftarrow x \starpath y_2 \implies y_1 \join y_2 \right)$]

---

Q: Give a proof sketch of the following theorem: if a relation $R$ is confluent, then every element has at most one normal form.
A: An element $x$ can have zero, one, or many normal forms. The first two cases satisfy the statement. The third case leads to a contradiction: because $x$ is a common ancestor of any two normal forms, by confluence, those normal forms are joinable, and if they are joinable, they can't be normal.

---

Q: Prove the following theorem: if a relation $R$ is confluent, then every element has at most one normal form.
A: Let $\text{Confluent}(R)$ and pick a term $x$. There are two possibilities.

One, $x$ has zero or one normal form, which satisfies the theorem.

Two, $x$ has more than one normal form. Pick at least two normal forms $y$ and $z$. We know $x \starpath y$ and $x \starpath z$, thus $y \conv z$ and by confluence, $y \join z$, which means they can't be normal forms. Contradiction.

---

Q: Give a proof sketch of the following theorem: if a relation $R$ is normalizing and confluent, then every element has a unique normal form.

A: If $R$ is normalizing then every element must have at least one normal form, and we know that under confluence, multiple normal forms lead to a contradiction. Therefore, $x \join$ is unique.

---

Q: Explain the intuition behind the following theorem: if a relation $R$ is normalizing and confluent, then every element has a unique normal form.
A: Normalizing means every element has at least one normal form. Confluence means multiple normal forms must be joinable, i.e., not normal forms at all. Therefore this implies uniqueness of the normal form.

---

C:
Term: [finitely branching relation]

Definition: [A relation where every element has only finitely many direct successors.]

---

C:
Term: [globally finite relation]

Definition: [A relation where every element has only finitely many distinct successors.]

---

Q: Difference between termination and global finitude of a relation.
A: Termination: the chains from every element have finite length.

Global finitude: the set of distinct successors from every element is finite.

---

Q: Give an example of a relation that is globally finite but non-terminating.
A:
$$\set{a \to b, b \to a}$$

The set of successors is $\set{a,b}$ for every element.

---

C:
Term: [acyclic relation]

Definition: [A relation where there is no element $a$ such that $a \pluspath a$.]

---

Q: Give an example of a relation that is terminating but not finitely branching.
A: The relation:

$$
\begin{align*}
a \to n, & \forall n \in \N \\\\
n \to b, & \forall n \in N
\end{align*}
$$

That is: $a$ rewrites to any natural number, and every natural number rewrites to $b$.

---

C: Let $R$ be a relation. Then:

[$\text{Diamond}(R)$]
$\iff$
[$\left( y_1 \leftarrow x \rightarrow y_2 \implies \exists z . y_1 \rightarrow z \leftarrow y_2 \right)$]

---

C:
Term: [signature]

Definition: [a set of function symbols, each of which is associated with a natural number called its arity.]

---

C:
Notation: [$\Sigma^{(n)}$]

Definition: [the set of $n$-ary symbols in a signature $\Sigma$.]

---

C: Let $\Sigma$ be a signature. The elements of [$\Sigma^{(0)}$] are called [constant symbols].

---

Q: Let $\Sigma$ be a signature, and $X$ a set of variables such that $\Sigma \cap X = \emptyset$. How do we construct the set of **$\Sigma$-terms over $X$**?
A: By induction: every variable is a term, and every application of function symbols in $\Sigma$ to a list of terms is also a term.

---

C:
Notation: [$T(\Sigma, X)$]

Definition: [the set of $\Sigma$-terms over $X$.]

---

C:
Notation: [$\mathcal{Pos}(t)$]

Definition: [the set of positions in a term $t$.]

---

C:
Notation: [$\mathcal{Var}(t)$]

Definition: [the set of variables in a term $t$.]

---

C:
Notation: [$t |_p$]

Definition: [the subterm of $t$ at position $p$.]

---

C:
Term: [ground term]

Definition: [a term with no free variables.]

---

C: Let $t$ be a term. Then:

[$\text{Ground}(t)$]
$\iff$
[$\left( \mathcal{Var}(t) = \emptyset \right)$]

---

C:
Notation: [$T(\Sigma)$]

Definition: [the set of ground terms over a signature $\Sigma$.]

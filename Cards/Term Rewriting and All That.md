Q: Define termination of a rewrite system.
A: A rewrite system terminates when any expression can be rewritten into an expression for which no more rules apply.

C:
Term: [normal form]

Definition: [An expression for which no more rules apply.]

C:
Term: [confluence]

Definition: [A property of a rewrite system where, if $x \stackrel{+}{\to} y_1$ and $x \stackrel{+}{\to} y_2$, then $y_1 \downarrow y_2$.]

C: A term $x$ is [reducible] iff [there exists a $y$ such that $x \to y$].

C: Saying "$x$ is [irreducible]" is equivalent to saying "$x$ is a [normal form]".

Q: Let $x$ be a term. How do we denote "$x$ has a unique normal form"?
A: $x \downarrow$

Q: Let $x$ be a term. What does the notation $x \downarrow$ mean?
A: $x$ has a unique normal form.

C: The notation [$x \downarrow$] means that $x$ [has a unique normal form].

Q: Express "$x$ is an ancestor of $y$" symbolically.
A: $x \stackrel{\*}{\to} y$

Q: Express "$x$ is a direct ancestor of $y$" symbolically.
A: $x \to y$

Q: Express "$y$ is a successor of $x$" symbolically.
A: $x \stackrel{\*}{\to} y$

Q: Express "$y$ is a direct successor of $x$" symbolically.
A: $x \to y$

C: $x$ and $y$ are called [joinable] iff [there exists a $z$ such that $x \stackrel{+}{\rightarrow} z$ and $y \stackrel{+}{\rightarrow} z$].

C: Let $x$ and $y$ be terms. The notation [$x \downarrow y$] means that $x$ and $y$ are [joinable].

Q: When is a rewrite system confluent?
A: If $x \stackrel{+}{\to} y_1$ and $x \stackrel{+}{\to} y_2$, then $y_1 \downarrow y_2$.

Q: Define confluence in plain language.
A: If two terms have a common (possibly indirect) ancestor, they are joinable.

Q: Let $R$ be a relation. Define $\text{Confluent}(R)$ symbolically.

$$
\text{Confluent}(R) \iff \ldots
$$

A:

$$
\text{Confluent}(R) \iff \left(
y_1 \stackrel{\*}{\leftarrow} x \stackrel{\*}{\rightarrow} y_2
\implies
y_1 \downarrow y_2
\right)
$$

C:
Term: [convergent rewrite system]

Definition: [A rewrite system that is both terminating and confluent.]

C: A relation is called [Church-Rosser] iff [$x \stackrel{\*}{\leftrightarrow} y \implies x \downarrow y$].

Q: Let $R$ be a relation. Define $\text{ChurchRosser}(R)$ symbolically.

$$
\text{ChurchRosser}(R) \iff \ldots
$$

A:

$$
\text{ChurchRosser}(R) \iff
\left(
  x \stackrel{*}{\leftrightarrow} y \implies x \downarrow y
\right)
$$

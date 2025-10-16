Q: Define termination of a rewrite system.
A: A rewrite system terminates when any expression can be rewritten into an expression for which no more rules apply.

C:
Term: [normal form]

Definition: [An expression for which no more rules apply.]

C:
Term: [confluence]

Definition: [A property of a rewrite system where: if $x \stackrel{+}{\to} y_1$ and $x \stackrel{+}{\to} y_2$, then $y_1 \downarrow y_2$.]

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

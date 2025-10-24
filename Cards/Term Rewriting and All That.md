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
A: $x \starpath y$

Q: Express "$x$ is a direct ancestor of $y$" symbolically.
A: $x \to y$

Q: Express "$y$ is a successor of $x$" symbolically.
A: $x \starpath y$

Q: Express "$y$ is a direct successor of $x$" symbolically.
A: $x \to y$

C: $x$ and $y$ are called [joinable] iff [there exists a $z$ such that $x \stackrel{+}{\rightarrow} z$ and $y \stackrel{+}{\rightarrow} z$].

C: Let $x$ and $y$ be terms. The notation [$x \downarrow y$] means that $x$ and $y$ are [joinable].

Q: When is a rewrite system confluent?
A: If $x \stackrel{+}{\to} y_1$ and $x \stackrel{+}{\to} y_2$, then $y_1 \downarrow y_2$.

Q: Define confluence in plain language.
A: If two terms have a common (possibly indirect) ancestor, they are joinable.

C:
[$\text{Confluent}(R)$]
$\iff$
[$\left( y_1 \lstarpath x \starpath y_2 \implies y_1 \downarrow y_2 \right)$]

C:
Term: [convergent rewrite system]

Definition: [A rewrite system that is both terminating and confluent.]

C:
[$\text{ChurchRosser}(R)$]
$\iff$
[$\left( x \conv y \implies x \downarrow y \right)$]

Q: Define the identity relation $R^0$ on a set $A$.
A: $$ R^0 = \set{(x,x) \mid x \in A} $$

Q: Rewrite $x \starpath y$ in Prolog notation.
A: $$ R^{\*}(x,y) $$

Q: How do you read $x \conv y$?
A: "$x$ and $y$ are convertible"

C:
Term: [normalizing rewrite system]

Definition: [A rewrite system where every element has at least one normal form.]

C:
[$\text{SemiConfluent}(R)$]
$\iff$
[$\left( y_1 \leftarrow x \starpath y_2 \implies y_1 \downarrow y_2 \right)$]

Q: Give a proof sketch of the following theorem: if a relation $R$ is confluent, then every element has at most one normal form.
A: An element $x$ can have zero, one, or many normal forms. The first two cases satisfy the statement. The third case leads to a contradiction: because $x$ is a common ancestor of any two normal forms, by confluence, those normal forms are joinable, and if they are joinable, they can't be normal.

Q: Prove the following theorem: if a relation $R$ is confluent, then every element has at most one normal form.
A: Let $\text{Confluent}(R)$ and pick a term $x$. There are two possibilities.

One, $x$ has zero or one normal form, which satisfies the theorem.

Two, $x$ has more than one normal form. Pick at least two normal forms $y$ and $z$. We know $x \starpath y$ and $x \starpath z$, thus $y \conv z$ and by confluence, $y \downarrow z$, which means they can't be normal forms. Contradiction.

Q: Give a proof sketch of the following theorem: if a relation $R$ is normalizing and confluent, then every element has a unique normal form.

A: If $R$ is normalizing then every element must have at least one normal form, and we know that under confluence, multiple normal forms lead to a contradiction. Therefore, $x \downarrow$ is unique.

Q: Explain the intuition behind the following theorem: if a relation $R$ is normalizing and confluent, then every element has a unique normal form.
A: Normalizing means every element has at least one normal form. Confluence means multiple normal forms must be joinable, i.e., not normal forms at all. Therefore this implies uniqueness of the normal form.

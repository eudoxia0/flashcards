C: The set of the [natural numbers] is denoted by [$\N$].

C: The set of the [integers] is denoted by [$\Z$].

C: The set of the [rational numbers] is denoted by [$\Q$].

Q: Why does $\Q$ denote the rational numbers?
A: The Q stands for quotient.

Q: Why does $\Z$ denote the integers?
A: German for "Zahl" (number).

Q: Define $\Q$ using set builder notation
A:
$$
\Q = \set{ \frac{p}{q} : p,q \in \Z, q \neq 0 }
$$

Q: When is a collection of sets said to be "pairwise disjoint"?
A: Where every pair of sets in the collection is disjoint.

Q: Define the factorial function symbolically.

$$\fact{n} = \ldots$$
A: $$\fact{n} = n \times \fact{n-1}$$

Q: Express $n!$ using product notation.
A: $$\prod\limits_{i=1}^n i$$

Q: Evaluate: $0!$
A: $1$

Q: Evaluate: $1!$
A: $1$

Q: Evaluate: $2!$
A: $2$

Q: Evaluate: $3!$
A: $6$

Q: Evaluate: $4!$
A: $24$

Q: Evaluate: $5!$
A: $120$

C: The $n$th triangular number is [the number of dots in an equilateral triangle with $n$ dots per side].

Q: How do you read this notation?

$$\binom{n}{k}$$

A: "$n$ choose $k$"

Q: Define $\binom{n}{k}$ symbolically.

$$
\binom{n}{k} = \ldots
$$

A:
$$
\binom{n}{k} = \frac{\fact{n}}{\fact{k}\fact{n-k}}
$$

Q: What is the combinatorial meaning of $\binom{n}{k}$?
A: From a set of size $n$, we can chose $\binom{n}{k}$ sets of size $k$.

C: The dual of the prime numbers are the [composite] numbers.

C: The dual of the composite numbers are the [prime] numbers.

C: Every positive integer is either [prime], [composite], or [one].

C: Term: [composite number]

Definition: [A positive integer that is the product of two smaller positive integers.]

Q: Define the predicate $\text{Composite} : \N \to \text{Bool}$ symbolically.

$$\text{Composite}(n) = \ldots$$

A: $$\text{Composite}(n) = \exists a,b \in \Z^+ . 1 \lt a \lt n, 1 \lt b \lt n, ab = n$$

Q: What does HMAC stand for?
A: Hash-based Message Authentication Code.

Q: What does MAC stand for?
A: Message authentication code.

Q: What is a MAC used for?
A: To verify the authorship and integrity of a message contents.

Q: Explain length-extension attacks.
A: Given a susceptible hash function $\mathrm{H}$, and the length of a string $a$, an attacker can calculate $\mathrm{H}(a ~||~ b)$ for arbitrary $b$, without needing to know $a$.

Q: How can a length-extension attack be used to break a MAC?
A: Given a MAC like $\mathrm{H}(\mathrm{key} ~||~ \mathrm{text})$, if the length of $\mathrm{key}$ is known, an attacker can compute the hash of any message (i.e., sign messages) without knowing $\mathrm{key}$.

C: Hash functions based on the [Merkle–Damgård] construction are susceptible to length-extension attacks.

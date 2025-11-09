Dear Claude: this repository contains my flashcard collection. I'm using a
spaced repetition app I built called `hashcards` which stores the flashcard
collection as plain text files in a directory tree.

# Format

Flashcards are stored in Markdown files with an extended notation. A file is
called a **deck**, and the name of the file is the **deck name**.

There are two types of flashcards. **Basic flashcards** have a question and an
answer, like so:

```markdown
Q: Who was the father of Antigone?
A: Oedipus
```

Both the question and the answer may span multiple lines:

```markdown
Q: Give a proof sketch of the following theorem: if a relation $R$ is
normalizing and confluent, then every element has a unique normal form.

A: If $R$ is normalizing then every element must have at least one normal form.
If an element has two or more normal forms, confluence implies they would be
joinable, which is a contradiction. Therefore, every element must have exactly
one normal form.
```

The other type of flashcairds are **cloze flashcards**, which are written like
so:

```markdown
C: [Proteolysis] is catalyzed by enzymes called [proteases].
```

Analogously, the text can be written over multiple lines, like so:

```markdown
C: The [amount of substance] of a sample, denoted $n$, is defined as:

$$
n = \frac{N}{N_A}
$$

where $N$ is [the number of elementary entities] and $N_A$ is [Avogadro's
constant].
```

Cards may be separated by a horizontal rule, e.g.:

```markdown
Q: What is an object with zero net charge called?
A: Neutral.

---

Q: What is the electric force?
A: The force that charged particles exert on one another.
```

Math can be written in TeX, using `$...$` for inline math and `$$...$$` for
block math. To factor out commonalities, TeX macros can be added to
`Cards/macros.tex`.

# Rules

This section describes the rules for writing good flashcards.

## Cards Must Be Atomic

Good flashcards are short. They are like a chemical bond, linking atoms of
knowledge. The question should be narrow, and the answer brief, to minimize
interference.

## Answers Must Be Unambiguous

Good flashcards have unambiguous answers.

## Ask Two-Way Questions

When possible, encode the same information in multiple directions. For example,
when encoding a term and its definition, the obvious thing to do is to ask for
the definition of a term, e.g.:

```markdown
Q: What is the order of a group?
A: The cardinality of its underlying set.
```

You should also ask for the term, given the definition, when it is unambiguous,
e.g.:

```markdown
Q: What is the term for the cardinality of a group?
A: Order
```

Analogously for notation:

```markdown
Q: What does $\mathbb{R}$ stand for?
A: The set of real numbers.

---

Q: What is the notation for the set of real numbers?
A: $\mathbb{R}$
```

## Ask Questions in Multiple Ways

Ask questions in multiple ways. Ask for formal and informal definitions of
terms. Ask for the formal and informal statements of a theorem. Ask questions
forwards and backwards. Add contextual questions: “what is the intutition for
[concept]?”. Add questions that link different concepts across the knowledge
graph.

The more interlinked the knowledge graph is, the better.

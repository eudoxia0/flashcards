C: Term: [streaming multiprocessor]

Definition: [a core on an NVIDIA GPU.]

---

C: Term: [kernel]

Definition: [a block of code that runs on the GPU.]

---

C: Term: [thread block]

Definition: [a {1,2,3}-dimensional array of threads.]

---

Q: How many threads can a thread block have?
A: Between 1 and 1024.

---

C: Term: [grid]

Definition: [a {1,2,3}-dimensional array of thread blocks.]

---

C: Term: [warp]

Definition: [a bundle of threads within a thread block.]

---

Q: How many threads can a warp have?
A: Between 1 and 32.

---

Q: What does PTX stand for?
A: Parallel Thread Execution.

---

Q: What is the name of the CUDA ISA?
A: PTX.

---

Q: What does SASS stand for?
A: Streaming ASSembler.

---

Q: What is the name of the internal NVIDIA GPU ISA?
A: SASS.

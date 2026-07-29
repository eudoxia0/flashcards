---
name = 'GPUs'
---

T: streaming multiprocessor
D: a core on an NVIDIA GPU.

---

T: kernel
D: a block of code that runs on the GPU.

---

T: thread block
D: a {1,2,3}-dimensional array of threads.

---

Q: How many threads can a thread block have?
A: Between 1 and 1024.

---

T: grid
D: a {1,2,3}-dimensional array of thread blocks.

---

T: warp
D: a bundle of threads within a thread block.

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

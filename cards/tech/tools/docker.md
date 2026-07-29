---
name = 'Docker'
---

Q: What is a Docker image?
A: A filesystem snapshot used to create a container.

---

Q: What is a Docker container?
A: A running instance of an image.

---

Q: What's the difference between Docker images and containers?
A: Images are blueprints, containers are instances of those blueprints.

---

Q: How are Docker images created?
A: By a set of instructions called a Dockerfile.

---

Q: What is a Docker registry?
A: A place where images are stored.

---

Q: What are Docker volumes for?
A: Persisting data outside of the container.

---

Q: What is the command to build a Dockerfile in the current directory?
A: `docker build .`

---

Q: What does `docker build .` do?
A: Builds the Dockerfile in the current directory.

---

Q: What is a Docker image tag?
A: A human-readable name for the image.

---

Q: How do you run a tagged Docker image with its default command?
A: `docker run <tag>`

---

Q: How do you run a tagged Docker image with a custom command?
A: `docker run <tag> <command>`

---

Q: How do you give a name to a Docker image when building it?
A: `docker build . -t name`

---

Q: How do you start a Docker container, given its ID?
A: `docker start <container ID>`

---

Q: What does the `-a` flag in `docker start` stand for?
A: attach

---

Q: How do you execute a command in a running Docker container?
A: `docker exec -it <container ID> <command>`

---

Q: What does Docker's `-it` flag mean?
A: `-i` means attach to the terminal, `-t` means use the tty

---

Q: Command to create a Docker container from an image ID.
A: `docker create <image ID>`

---

Q: `docker run` is the composition of which commands?
A: `create` and `start`

---

Q: What's the command to get the logs for a Docker container?
A: `docker logs <container ID>`

---

Q: What's Docker's port mapping format?
A: `HOST:CONTAINER`

---

C: In a Docker port mapping (e.g. `123:456`), the [container] port is on the [right].

---

C: In a Docker port mapping (e.g. `123:456`), the [host] port is on the [left].

---

Q: How do you stop a Docker container?
A: Using either `docker stop` or `docker kill`.

---

Q: What's the difference between `docker stop` and `docker kill`?
A: `stop` can do cleanup, `kill` is more fatal.

---

Q: What signal does `docker kill` send?
A: `SIGKILL`

---

Q: What signal does `docker stop` send?
A: `SIGTERM`

---

Q: What's the command to blow away your local Docker data?
A: `docker system prune`

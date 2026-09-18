# DevOps Project

A beginner-friendly DevOps project demonstrating how to build, test,
containerize, and automate a Java Maven application using Git, Maven,
Docker, and Jenkins.

---

## Project Architecture

```text
Developer
    |
    v
  GitHub
    |
    v
  Jenkins
    |
    +----------------+
    |                |
    v                v
  Maven            Docker
    |                |
    v                v
 Build/Test       Container
    |                |
    +-------+--------+
            |
            v
       Application

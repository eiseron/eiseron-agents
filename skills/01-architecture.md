# Architecture & Engineering Standards

This document defines the high-level architectural patterns and engineering standards for all Eiseron projects. AI agents must strictly adhere to these principles to ensure consistency, efficiency, and scalability.

## Core Principles

### 1. Uncle Bob's Clean Code
- **Rule:** Prioritize **Clean Code** as defined by Robert C. Martin (Uncle Bob).
- **Focus:** Write code that is readable, maintainable, and self-documenting. Prioritize meaningful names, small functions, and clear separation of concerns within the vertical context.

### 2. Vertical Development
- **Standard:** Implement features **vertically**, handling the entire stack from the database to the UI.
- **Tooling:** Use **Phoenix LiveView** as the primary engine for interactive UIs, ensuring the frontend and backend remain integrated within the same developmental context.

---

## Tech Stack Preferences

We prioritize tools that offer the best balance of efficiency and execution cost.

### 1. Phoenix & Elixir
- **Use Case:** High-concurrency, I/O intensive services, web applications, and real-time systems.
- **Advantage:** The Erlang VM (BEAM) provides unmatched reliability and efficiency for handling thousands of simultaneous connections with low overhead.

### 2. Go (Golang)
- **Use Case:** CPU-bound tasks and high-performance microservices requiring lower-level control.
- **Advantage:** Superior execution speed for compute-intensive operations while maintaining simplicity.

### 3. Contextual Choice
- **Rule:** Select the most efficient tool for the specific mission. Specialized tasks (e.g., AI/ML) may use appropriate toolsets (like Python) based on performance and maintenance needs.

---

## Infrastructure & Workflow

### 1. Mandatory Containerization
- **Requirement:** Fully containerize every project using Docker for both runtime and development.
- **Strategy:** Always define infrastructure as code (IaC) using Terraform or equivalent.

### 2. Mobile Strategy
- **Standard:** Use **Webview** clients for mobile applications to leverage existing frontend code and simplify cross-platform updates.

### 3. Rigorous Planning
- **DDD Phase:** Document a detailed Domain-Driven Design plan (Bounded Contexts, Aggregates) before any coding occurs.
- **Implementation Planning:** Create an `implementation_plan.md` for every significant feature, specifying interfaces, routes, and APIs.

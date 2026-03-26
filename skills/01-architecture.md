# Architecture & Engineering Standards

This document defines the high-level architectural patterns and engineering standards for all Eiseron projects. AI agents must strictly adhere to these principles to ensure consistency, efficiency, and scalability.

## Core Principles

### 1. Uncle Bob's Clean Code
- **Rule:** **Strictly** follow the **Clean Code** principles as defined by Robert C. Martin (Uncle Bob).
- **Readability:** Prioritize **self-documenting code** over comments. Create small, focused methods with highly descriptive names that clearly state their purpose. If a block of code requires a comment to explain *what* it does, refactor it into a named function instead.
- **Focus:** Maintain small functions and clear separation of concerns within the vertical context.

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

### 3. Modular Monolith & DDD
- **Context Separation:** Even when developed as a monolith, organized the application strictly by the **Bounded Contexts** defined during the DDD phase.
- **Inter-Module Communication:** Ensure all communication between modules respects the directions defined by the DDD architecture. Accessing a resource (e.g., database table) managed by another module directly is prohibited.
- **Internal APIs:** Each module must expose an internal API (a well-defined set of public methods) for consumption by other modules. This ensures that the system is ready for a future transition to microservices with minimal refactoring.

### 4. Rigorous Planning
- **DDD Phase:** Document a detailed Domain-Driven Design plan (Bounded Contexts, Aggregates) before any coding occurs.
- **Implementation Planning:** Create an `implementation_plan.md` for every significant feature, specifying interfaces, routes, and APIs.

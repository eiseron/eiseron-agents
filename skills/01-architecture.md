# Architecture & Engineering Standards

This document defines the high-level architectural patterns and engineering standards for all Eiseron projects. AI agents must strictly adhere to these principles to ensure consistency, efficiency, and scalability.

## Tech Stack Preferences

We prioritize tools that offer the best balance of efficiency and execution cost.

### 1. Phoenix & Elixir
- **Use Case:** High-concurrency, I/O intensive services, web applications, and real-time systems.
- **Why:** Elixir's Erlang VM (BEAM) provides unmatched reliability and efficiency for handling thousands of simultaneous connections with low overhead.
- **Vertical Development:** We **avoid** separating frontend from backend. We prefer developers to work **vertically**, handling the entire feature stack. **Phoenix LiveView** is our primary tool for achieving this, as it allows building rich, interactive UIs without a separate JS framework.
- **Guideline:** Prefer Phoenix for any service that interacts heavily with databases or external APIs.

### 2. Go (Golang)
- **Use Case:** CPU-bound tasks, high-performance microservices requiring lower-level control than Elixir.
- **Why:** Go offers superior execution speed for compute-intensive operations while maintaining simplicity and fast compilation.

### 3. Mobile Strategy
- **Prioritize Webviews:** For mobile applications, we prioritize the use of **Webview** clients. This allows us to leverage our existing frontend code and simplify the update process across multiple platforms.

### 3. Contextual Efficiency
- **General Rule:** Always seek the most efficient language/tool for the specific problem context. If a specialized task requires a different toolset (e.g., Python for AI/ML), justify its use based on technical performance and maintenance cost.

---

## Infrastructure & Environment

### 1. Mandatory Containerization
- **Requirement:** Every project must be fully containerized using Docker.
- **Scope:** This applies to both production runtime environments and local development setups.
- **Guideline:** Prefer `compose.yml` for orchestrating development environments to ensure "it works on my machine" consistency.

### 2. Simplicity & Scale
- **Rule:** Choose the simplest possible architecture that meets the current and near-future scalability requirements. Avoid over-engineering.
- **Cloud Native:** Leverage managed services where they reduce operational complexity, but maintain portability through containerization.

### 3. Infrastructure as Code (IaC)
- **Requirement:** Manual infrastructure configuration via UI is **FORBIDDEN**.
- **Tools:** Use Terraform, OpenTofu, or Pulumi to define all infrastructure.

---

## Engineering Workflow

Implementation is a multi-phase process. Coding must never start without approved plans.

### 1. DDD (Domain-Driven Design) Phase
- **Requirement:** A detailed DDD plan must be documented before writing any application code.
- **Focus:** Identify Bounded Contexts, Entities, Value Objects, and Aggregates. Define the Ubiquitous Language.

### 2. Implementation Planning
- **Requirement:** Create an `implementation_plan.md` (or equivalent) for every significant feature.
- **Content:** Must specify:
    - Interface changes (UI/UX).
    - API Routes and request/response schemas.
    - Database migrations/schema changes.
    - Integration points.

### 3. Verification & Quality
- **Focus:** Every feature must include a verification plan (automated tests + manual validation steps).
- **Style:** Follow the patterns defined in `03-testing-bdd.md`.

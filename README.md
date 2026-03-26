# Eiseron AI Agent Guidelines

This repository contains the official engineering constitution for Eiseron. It defines the standards, workflows, and skills required for both human developers and AI agents (Cursor, Windsurf, etc.) to maintain a high-quality, secure, and maintainable codebase.

## Core Constitution
- [00-ai-conventions.md](00-ai-conventions.md): Fundamental rules for AI interaction, communication, and basic git etiquette.

## Engineering Skills
The following modules provide detailed standards for various engineering domains:

1.  **Architecture & Design**
    - `01-architecture.md`: Clean Code, Phoenix/Vertical Dev, and Modular Monolith principles.
2.  **Data & Storage**
    - `02-database-standards.md`: Database naming, schema, and auditing rules.
3.  **Security & Privacy**
    - `03-security.md`: Authentication, authorization, and secure-by-default standards.
4.  **Frontend & UX**
    - `04-frontend.md`: Pure CSS, Semantic HTML, and Component-Driven Development.
5.  **Dependency Management**
    - `05-dependency-management.md`: Rules for selection, justification, and security of third-party libraries.
6.  **Quality Assurance**
    - `06-testing-bdd.md`: Testing Pyramid, BDD, and single-assertion patterns.
7.  **Infrastructure & DevOps**
    - `07-docker-infra.md`: Standardized Docker workflows and environment isolation.
8.  **Observability & Reliability**
    - `08-observability-ops.md`: Logging, monitoring, and health standards.
9.  **Workflow & Version Control**
    - `09-git-workflow.md`: Advanced Git strategies, release cycles, and branch protection.
10. **Communication & Knowledge**
    - `10-documentation.md`: Documentation standards (Sync, Format, and Types).

## Usage

AI Agents **must** perform "Self-Discovery" at the start of every session by:
1. Listing the files in this repository.
2. Reading the contents of `00-ai-conventions.md`.
3. Reading relevant skill modules based on the task at hand.

All code generated must strictly adhere to these guidelines. Any deviation requires explicit user approval.

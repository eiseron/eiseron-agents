# Eiseron Agents

This repository contains directives and standards for AI Agents operating across **Eiseron** brand projects.

## Repository Structure

- **[00-ai-conventions.md](00-ai-conventions.md):** The Single Source of Truth (SSoT) for AI conventions.
- **[AGENTS.md](AGENTS.md):** Symbolic link to central conventions for easy agent access.
- **[.cursorrules](.cursorrules):** Symbolic link to central conventions for Cursor integration.
- **[.windsurfrules](.windsurfrules) / [Claude.md](Claude.md):** Tool-specific adapters for other AI environments.
- **[skills/](skills/):** Detailed behavior modules and technical standards.
    - `01-architecture.md`: Clean Architecture and Design Patterns.
    - `02-docker-infra.md`: Infrastructure and container standards.
    - `03-testing-bdd.md`: Testing methodology (TDD/BDD) and Testing Pyramid.
    - `04-git-workflow.md`: Git workflow and Conventional Commits.
    - `05-frontend.md`: Frontend styling (Pure CSS) and Webview standards.
    - `06-security.md`: Security standards (Auth, Authorization, and Testing).
    - `07-documentation.md`: Documentation standards (Sync, Format, and Types).
    - `08-database-standards.md`: Database naming, schema, and auditing rules.
    - `09-observability-ops.md`: Logging, monitoring, and health standards.
    - `10-dependency-management.md`: Rules for selection, justification, and security of third-party libraries.

## Usage

This repository should be attached to the context of AI agents at the start of every task within any Eiseron project.

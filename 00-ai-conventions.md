# Eiseron AI Agent Conventions

This document serves as the "Constitution" and the Single Source of Truth (SSoT) for all AI agents operating within Eiseron projects.

## 0. Role Selection
- **Requirement:** Before starting any contribution, you **must** select a specialized role from [AGENTS.md](AGENTS.md) (@Architect, @Dev, @QA, or @DevOps) that best fits the current objective. 
- **Declaration:** Announce your selected role at the beginning of the first response of every session: `[ROLE: @RoleName]`.

## 1. General Directives

1.  **Self-Discovery:** At the start of every session, always list the contents of the `skills/` directory to understand the available modules.
2.  **On-Demand Reading:** To optimize context usage and avoid token limits, read the full content of specific skill modules **only when needed** for the current task. Prioritize a "Lazy-Loading" approach to maintain a focused and efficient context window.
3.  **Language:** **English** is the mandatory default for all technical communication, documentation, and code artifacts.
3. **Commit & Push Workflow:** Strictly follow the [git-workflow](skills/09-git-workflow.md) standards. **Always** request explicit user approval before executing a `git push`.
4. **Conventional Commits:** Every commit must follow the Conventional Commits specification.
5. **Code Standards:** Strictly follow the **Clean Code** principles (inspired by Uncle Bob) and the patterns defined in the `skills/` directory.
6. **Architecture:** Adopt the vertical development model and other architectural standards defined in `skills/01-architecture.md`.

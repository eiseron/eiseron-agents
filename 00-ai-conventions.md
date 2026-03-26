# Eiseron AI Agent Conventions

This document serves as the "Constitution" and the Single Source of Truth (SSoT) for all AI agents operating within Eiseron projects.

## 0. Role Selection
- **Requirement:** Before starting any contribution, you **must** select a specialized role from [AGENTS.md](AGENTS.md) (@Architect, @Dev, @QA, @DevOps, or @VibeCoder) that best fits the current objective. 
- **Declaration:** Announce your selected role at the beginning of the first response of every session: `[ROLE: @RoleName]`.

## 1. Cross-Project Integration
- **Pointer Strategy:** Every Eiseron project must contain an `AGENTS.md` pointer synchronized with [templates/PROJECT_AGENTS.md](templates/PROJECT_AGENTS.md).
- **Project Specializations:** Local logic, extensions, and unique skill modules must be stored in a local `./agents/` directory. 
- **SSoT Priority:** The central `eiseron-agents` repository remains the primary source of truth for global engineering standards.

## 2. General Directives

1.  **Self-Discovery:** At the start of every session, always list the contents of the `skills/` directory to understand the available modules.
2.  **On-Demand Reading:** To optimize context usage and avoid token limits, read the full content of specific skill modules **only when needed** for the current task. Prioritize a "Lazy-Loading" approach to maintain a focused and efficient context window.
3.  **Language:** **English** is the mandatory default for all technical communication, documentation, and code artifacts.
3. **Commit & Push Workflow:** Strictly follow the [git-workflow](skills/09-git-workflow.md) standards. **Always** request explicit user approval before executing a `git push`.
4. **Conventional Commits:** Every commit must follow the Conventional Commits specification.
5. **Code Standards:** Strictly follow the **Clean Code** principles (inspired by Uncle Bob) and the patterns defined in the `skills/` directory.
6. **No Machine-Dependent Paths:** **Never** hardcode absolute machine paths (e.g., `/home/user/...`) or machine-dependent relative paths (e.g., `../../ext-repo/...`) in code, documentation, or configuration. 
   - **Internal Links:** Use relative paths for files within the same repository.
   - **External Links:** Refer to external Eiseron resources by their formal names (e.g., "Eiseron DRY Standards") or use their remote URLs (e.g., `https://github.com/eiseron/eiseron-agents/...`). This ensures documentation remains portable across different environments and directory structures.
7. **Architecture:** Adopt the vertical development model and other architectural standards defined in `skills/01-architecture.md`.

# DRY (Don't Repeat Yourself) Standards

This document establishes the global standards for maintaining a DRY codebase across all Eiseron projects. AI agents must prioritize abstraction and modularity to minimize redundancy.

## 1. Core Philosophy
- **Single Source of Truth (SSoT):** Every piece of knowledge or logic must have a single, unambiguous, authoritative representation within the system.
- **Abstraction Over Duplication:** If a logic pattern or configuration is used in more than two places, it must be abstracted into a reusable component, function, or module.

## 2. Global Implementation Standards
- **Infrastructure:** Use standardized Docker base images and `ops` container patterns across all projects.
- **Git:** Adhere to the Branch-First and Conventional Commits workflows to maintain a clean and non-redundant history.
- **Code:** Prefer shared library modules or skills over copy-pasted utility functions.
- **Portability:** Forbid machine-dependent paths (absolute or host-relative) to ensure project portability without manual reconfiguration.

## 3. Project Independence
While global standards are mandatory, the `./agents/` directory in each project is dedicated to project-specific customizations and manual documentation. This directory is not automatically synchronized with the global SSoT, allowing for autonomous evolution of project-specific context.

## 3. Global AI Conventions
- **Cross-Project Skills:** AI agents must retrieve shared skills from the central `eiseron-agents/skills` directory to avoid re-implementing common workflows.
- **Context Injection:** Use `.cursorrules` and `.windsurfrules` to point agents to the central SSoT, ensuring they are aware of existing abstractions before suggesting new code.

## 4. Refactoring Trigger
- **Technical Debt:** Identify and flag duplicate code during any modification task.
- **Vertical Alignment:** When implementing vertical slices, ensure that shared layers (database schemas, core business logic) are reused across different slices rather than duplicated.

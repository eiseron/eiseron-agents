# DRY (Don't Repeat Yourself) Standards

This document establishes the global standards for maintaining a DRY codebase across all Eiseron projects. AI agents must prioritize abstraction and modularity to minimize redundancy.

## 1. Core Philosophy
- **Single Source of Truth (SSoT):** Every piece of knowledge or logic must have a single, unambiguous, authoritative representation within the system.
- **Abstraction Over Duplication:** If a logic pattern or configuration is used in more than two places, it must be abstracted into a reusable component, function, or module.

## 2. Project-Specific DRY Rules
Each project may extend these standards with a local `agents/DRY.md` file in the project root. This file should define:
- **Common Utility Modules:** Where to find and how to use shared utilities.
- **Domain Constants:** Centralized definitions for business logic constants.
- **Pattern Templates:** Standard ways to implement recurring features (e.g., specific form patterns).

## 3. Global AI Conventions
- **Cross-Project Skills:** AI agents must retrieve shared skills from the central `eiseron-agents/skills` directory to avoid re-implementing common workflows.
- **Context Injection:** Use `.cursorrules` and `.windsurfrules` to point agents to the central SSoT, ensuring they are aware of existing abstractions before suggesting new code.

## 4. Refactoring Trigger
- **Technical Debt:** Identify and flag duplicate code during any modification task.
- **Vertical Alignment:** When implementing vertical slices, ensure that shared layers (database schemas, core business logic) are reused across different slices rather than duplicated.

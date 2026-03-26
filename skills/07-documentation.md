# Documentation Standards

This document defines the requirements for technical documentation in Eiseron projects. High-quality documentation is essential for maintainability and seamless collaboration across human developers and AI agents.

## 1. Mandatory Interface Documentation
- **Requirement:** Every external interface provided by the application must be documented. This includes:
    - **APIs:** REST, GraphQL, or internal module APIs.
    - **GUIs:** User interfaces and design patterns.
    - **SDKs:** Libraries or client modules.
    - **Infrastructure:** CLI tools and deployment scripts.

## 2. Synchronization with Code
- **Rule:** Documentation must be updated in the **same commit** that introduces or modifies an interface. Documentation and code must never be out of sync.
- **Verification:** Before pushing any change, verify that all relevant documentation (READMEs, API docs, planning files) reflects the current state of the code.

## 3. Format & Language
- **Format:** Use **Markdown** (`.md`) as the primary format for all technical documentation.
- **Language:** **English** is the mandatory default for all technical documentation.
- **Target Audience:** If the system serves a non-English speaking audience, provide documentation in the target language or maintain a multilingual structure.

## 4. Documentation Types
- **Project README:** Every repository and major module must have a comprehensive `README.md` explaining its purpose, setup, and key components.
- **Implementation Plans:** Major features must be preceded by an `implementation_plan.md` (or RFC) that details the proposed design and interfaces.
- **Architecture Decision Records (ADR):** Use ADRs to document significant architectural decisions, explaining the "why" behind the choice to preserve context for future developers.
- **Visuals:** Use **Mermaid diagrams** or images to explain complex workflows, database schemas, or system architectures.

## 5. Examples & Clarity
- **Usage Examples:** Provide clear, copy-pasteable code examples for every API endpoint or SDK function.
- **Conciseness:** Keep documentation focused and concise. Avoid redundant explanations and prioritize clarity of use over internal implementation details.
- **Self-Documentation:** Remember that code should be self-documenting (per `01-architecture.md`). External documentation should focus on **intent**, **interfaces**, and **usage**.

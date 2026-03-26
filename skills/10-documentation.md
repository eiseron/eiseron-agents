# Documentation Standards

This document defines the requirements for technical documentation in Eiseron projects. High-quality documentation is essential for maintainability and seamless collaboration across human developers and AI agents.

## 1. Mandatory Interface Documentation
- **Requirement:** Every external interface provided by the application must be documented. This includes:
    - **APIs:** REST, GraphQL, or internal module APIs.
    - **GUIs:** User interfaces and design patterns.
    - **SDKs:** Libraries or client modules.
    - **Infrastructure:** CLI tools and deployment scripts.

## 2. Doc-as-Code Methodology
- **Directory Standard:** Maintain all technical documentation within a dedicated `/docs` directory located at the **project root**.
- **In-PR Synchronization:** **Mandatorily** include all required documentation updates within the same Pull Request that introduces or modifies a feature. Documentation and code must always remain in lockstep.
- **Versioned Publication:** Configure Git Tag pipelines to trigger the build and publication of versioned documentation (e.g., `/docs/v1.x`, `/docs/v2.x`).
- **Distribution Branch:** Utilize an isolated branch (e.g., `docs-static` or `gh-pages`) specifically for hosting final, static documentation files. This ensures that the documentation remains accessible to users across multiple historical versions.

## 3. Format & Language
- **Format:** Use **Markdown** (`.md`) as the primary format for all technical documentation.
- **Language:** **English** is the mandatory default for all technical documentation.
- **Target Audience:** If the system serves a non-English speaking audience, provide documentation in the target language or maintain a multilingual structure.

## 4. Documentation vs. Planning
- **Planning (Input):** Planning materials (e.g., DDD docs, RFCs, task lists) are considered project **inputs**. These may reside in separate repositories (e.g., `*-planning`) or shared resources and do not require inclusion within the application repository.
- **Documentation (Product):** Documentation is a project **product**. It must reside within the application repository, reflecting the code in real-time.
- **Static Site Generation (SSG):** Format documentation to be compatible with Static Site Generators (e.g., Hugo, Jekyll, Docusaurus). This allows for automated deployment via CI/CD pipelines to host live technical documentation.

## 5. Documentation Types
- **Project README:** Every repository and major module must have a comprehensive `README.md` explaining its purpose, setup, and key components.
- **API/SDK Reference:** Maintain real-time reference documentation for all external interfaces within the repository.
- **Architecture Decision Records (ADR):** Use ADRs to document significant architectural decisions, explaining the "why" behind the choice to preserve context for future developers.
- **Visuals:** Use **Mermaid diagrams** or images to explain complex workflows, database schemas, or system architectures.

## 6. Examples & Clarity
- **Usage Examples:** Provide clear, copy-pasteable code examples for every API endpoint or SDK function.
- **Conciseness:** Keep documentation focused and concise. Avoid redundant explanations and prioritize clarity of use over internal implementation details.
- **Self-Documentation:** Remember that code should be self-documenting (per `01-architecture.md`). External documentation should focus on **intent**, **interfaces**, and **usage**.

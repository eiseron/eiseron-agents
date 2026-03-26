# Dependency Management Standards

This document defines the principles for managing third-party dependencies in Eiseron projects. We prioritize codebase autonomy and security by minimizing external reliance.

## 1. Minimal Dependency Principle
- **Default Stance:** **Avoid** adding new dependencies whenever a feature can be implemented efficiently using the native capabilities of the language or existing project libraries.
- **Justification:** Every new dependency must be accompanied by a clear justification explaining why the addition is necessary and why current project resources are insufficient.

## 2. Selection & Trade-off Analysis
- **Research:** Before adopting a new library, research at least two alternatives and compare them.
- **Evaluation Criteria:**
    - **Maintainability:** Is the library actively maintained?
    - **Community Support:** Is there a strong community or corporate backing?
    - **Size & Performance:** What is the impact on the build size and runtime performance?
    - **Security:** Does the library have a history of frequent or unresolved vulnerabilities?
- **Trade-offs:** Document the trade-offs (e.g., development speed vs. long-term maintenance) when proposing a new dependency.

## 3. Versioning & Compatibility
- **Version Selection:** Prioritize the **most recent stable versions**. Avoid using "bleeding edge" or beta versions unless strictly necessary for a specific, documented feature.
- **Compatibility:** Verify that the dependency version is fully compatible with the project's runtime (e.g., Elixir/OTP version, Go version) and other existing libraries.

## 4. Security & Audit
- **Vulnerability Scanning:** Perform a security audit (e.g., `mix deps.audit`, `npm audit`, `snyk`) before finalizing the addition of any dependency.
- **License Compliance:** Ensure the dependency's license is compatible with the project's licensing model (e.g., MIT, AGPL-3.0).

## 5. Implementation Workflow
- **Pruning:** Regularly review the project's dependency list and remove any libraries that are no longer in use.
- **Updates:** Maintain dependencies updated to their latest stable versions to benefit from security patches and performance improvements, following the standard [testing-bdd](06-testing-bdd.md) and [git-workflow](09-git-workflow.md) procedures.

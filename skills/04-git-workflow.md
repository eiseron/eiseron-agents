# Git & Workflow Standards

This document defines the version control and workflow standards for Eiseron projects. Consistent git practices ensure maintainable history and seamless collaboration across AI agents.

## 1. Conventional Commits
- **Rule:** Every commit message must follow the [Conventional Commits](https://www.conventionalcommits.org/) specification.
- **Format:** `<type>(<scope>): <description>`
- **Types:**
    - `feat`: A new feature.
    - `fix`: A bug fix.
    - `docs`: Documentation only changes.
    - `style`: Changes that do not affect the meaning of the code (white-space, formatting, missing semi-colons, etc).
    - `refactor`: A code change that neither fixes a bug nor adds a feature.
    - `test`: Adding missing tests or correcting existing tests.
    - `chore`: Changes to the build process or auxiliary tools and libraries such as documentation generation.

## 2. Commit Atomic Property
- **Rule:** Commits must be atomic. Each commit should represent a single, logical change.
- **Why:** Atomic commits are easier to review, revert, and cherry-pick.

## 3. Branching Strategy
- **Standard:** Use short-lived feature branches targeting the `main` branch.
- **Naming:** `feat/<feature-name>`, `fix/<bug-name>`, `refactor/<refactor-name>`.
- **Merged:** Always use **Squash Merge** to keep the `main` branch history clean and linear.

## 4. Pre-commit Validation & Stability
- **Rule:** **Never** commit code that does not pass tests, linting, or compilation.
- **Standard:** Every commit in the history must be "stable" and buildable.
- **Requirement:** Before pushing any code, all automated checks must pass locally.
- **Elixir:** Run `mix precommit` or `mix format && mix lint && mix test`.
- **Go:** Run `go fmt` and `go test ./...`.
- **Action:** AI agents must fix all linting and test failures before submitting a PR or pushing to `main`.

## 5. Automated workflows
- **Rule:** Leverage CI/CD pipelines (e.g., GitHub Actions) to validate every push.
- **IaC:** Infrastructure changes must be applied via CI/CD after manual approval.

## 6. Pull Request Metadata
- **Description:** Provide a concise summary of *what* changed and *why*.
- **Task Reference:** Always link to the relevant task or issue ID in the PR description.
- **Verification:** Include a summary of the verification steps performed (automated and manual).

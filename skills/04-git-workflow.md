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
- **Scope Isolation:** Ensure each commit addresses a **single scope**. Keep database changes, backend logic, and UI updates in separate, atomic commits.

## 2. Commit Atomic Property
- **Rule:** Commits must be atomic. Each commit should represent a single, logical change.
- **Why:** Atomic commits are easier to review, revert, and cherry-pick.

## 3. Branching & Merging
- **Strategy:** Work on short-lived feature branches targeting `main`.
- **Merging:** Use **Squash Merge** to maintain a clean, linear history on the `main` branch.

## 4. Approval & Push Workflow
- **Rule:** Always request **explicit user approval** before executing a `git push`.
- **Validation:** Ensure all automated checks (e.g., `mix precommit`) have passed before requesting push approval.
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

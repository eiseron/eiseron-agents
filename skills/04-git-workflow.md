# Git & Workflow Standards

This document defines the version control and workflow standards for Eiseron projects. Consistent git practices ensure maintainable history and seamless collaboration across AI agents.

## 1. Conventional Commits & Atomic Property
- **Rule:** Strictly follow the [Conventional Commits](https://www.conventionalcommits.org/) specification (`feat:`, `fix:`, `refactor:`, etc.).
- **Atomic Commits:** Ensure each commit addresses a **single scope**. Keep database changes, backend logic, and UI updates in separate, atomic commits.
- **Stability:** Prioritize stable and buildable commits. While not strictly mandatory for every intermediate commit, maintaining a buildable history is highly recommended.

## 2. Infrastructure as Code (IaC)
- **Standard:** Define all infrastructure changes (GitHub repos, AWS resources, etc.) as code in the respective operations repositories.
- **Workflow:** Infrastructure changes must be applied via CI/CD or controlled terminal environments and linked to the corresponding feature or fix.

## 2. Branching & Environments
- **`main` (Beta/Staging):** Represents the test-ready code. Merges to `main` trigger automatic deployments to the **Beta** environment.
- **Feature Branches (`feature/`, `fix/`):** Short-lived branches created from `main` for active development.
- **Tags (Production):** Creations of Git tags trigger deployments to the **Production** environment.

## 3. Development Cycle
1. Create a branch from `main`: `git checkout -b feature/task-name`.
2. Implement changes with atomic, stable commits.
3. Open a Pull Request (PR) targeting the `main` branch.
4. **Merge Strategy:** Use **Squash and Merge** for short-lived branches (`feature/`, `refactor/`). **Never** use squash merge for `hotfix/` branches to ensure the history is preserved during backporting.
5. Verify the functionality in the **Beta** environment after the automatic deploy.

## 4. Release Cycle (Production)
1. Ensure the `main` branch is stable and all features are validated.
2. Create a signed tag on `main` following Semantic Versioning: `git tag -a v1.1.0 -m "Release description"`.
3. Push the tag to the remote: `git push origin v1.1.0`.
4. The CI/CD pipeline detects the tag and performs the **Production** deploy.

## 5. Hotfix Workflow (Critical Production Fixes)
When `main` contains unstable code that cannot yet be released:
1. Create a branch from the current production tag: `git checkout -b hotfix/description v1.1.0`.
2. Implement the fix with stable commits.
3. Create a new Patch tag: `git tag -a v1.1.1 -m "Hotfix: correction of bug X"`.
4. Push the tag to Production: `git push origin v1.1.1`.
5. **Backport:** Merge the hotfix branch back into `main` to ensure the fix persists in future releases.

## 7. Versioning Standards (SemVer)
- **MAJOR:** Structural changes or compatibility-breaking updates.
- **MINOR:** New functionalities or daily updates coming from `main`.
- **PATCH:** Urgent corrections (hotfixes) applied on top of the latest stable version.

## 8. Approval & Push Rule
- **Explicit Approval:** Always request **explicit user approval** before executing a `git push` for any branch or tag.
- **Validation:** Run all local validation checks (e.g., `mix precommit`) before requesting push approval.

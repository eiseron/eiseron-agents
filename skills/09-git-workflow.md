# Git & Workflow Standards

This document defines the version control and workflow standards for Eiseron projects. Consistent git practices ensure maintainable history and seamless collaboration across AI agents.

## 1. Conventional Commits
- **Rule:** Strictly follow the [Conventional Commits](https://www.conventionalcommits.org/) specification.
- **Commit Types:**
    - `feat`: A new feature.
    - `fix`: A bug fix.
    - `docs`: Documentation only changes.
    - `style`: Changes that do not affect the meaning of the code (white-space, formatting, etc.).
    - `refactor`: A code change that neither fixes a bug nor adds a feature.
    - `test`: Adding missing tests or correcting existing tests.
    - `chore`: Changes to the build process or auxiliary tools.

## 2. Commit Atomic Property
- **Rule:** Maintain atomic commits where each commit addresses a **single scope** and represents a single, logical change. Keep database changes, backend logic, and UI updates in separate, atomic commits.
- **Stability:** Prioritize stable and buildable commits. While maintaining buildable history is a strong preference, it is not a mandatory requirement for every intermediate commit.

## 3. Infrastructure as Code (IaC)
- **Standard:** Define all infrastructure changes (GitHub repos, AWS resources, etc.) as code in the respective operations repositories.
- **Workflow:** Link infrastructure changes to the corresponding feature or fix and apply them via CI/CD or controlled terminal environments.

## 4. Branching & Environments
- **`main` (Beta/Staging):** Represents the test-ready code. Merges to `main` trigger automatic deployments to the **Beta** environment.
- **Feature Branches (`feature/`, `fix/`):** Short-lived branches created from `main` for active development.
- **Tags (Production):** Creations of Git tags trigger deployments to the **Production** environment.

## 5. Development Cycle
- **Branch Strategy:** **Never** commit directly to the `main` branch unless specifically and explicitly instructed by the user.
- **Workflow Start:** Before beginning any new task, verify the current branch status. If the current branch is completed or if you are on `main`, perform the following:
    1. Switch to `main`: `git checkout main`.
    2. Synchronize with the remote: `git pull origin main`.
    3. Create a descriptive feature branch: `git checkout -b feature/task-name`.
- **Implementation:** Proceed with changes and commit using atomic, conventional messages.
- **Merge Strategy:** Use **Squash and Merge** for short-lived branches (`feature/`, `refactor/`). For **hotfix** branches, use **standard merges** to preserve the full commit history and ensure proper backporting.
- **Verification:** Validate the functionality in the **Beta** environment after the automatic deploy.

## 6. Release Cycle (Production)
1. Ensure the `main` branch is stable and all features are validated.
2. Create a signed tag on `main` following Semantic Versioning: `git tag -a v1.1.0 -m "Release description"`.
3. Push the tag to the remote: `git push origin v1.1.0`.
4. The CI/CD pipeline detects the tag and performs the **Production** deploy.

## 7. Hotfix Workflow (Critical Production Fixes)
When `main` contains unstable code that cannot yet be released:
1. Create a branch from the current production tag: `git checkout -b hotfix/description v1.1.0`.
2. Implement the fix with atomic commits.
3. Create a new Patch tag: `git tag -a v1.1.1 -m "Hotfix: correction of bug X"`.
4. Push the tag to Production: `git push origin v1.1.1`.
5. **Backport:** Merge the hotfix branch back into `main` to ensure the fix persists in future releases.

## 8. Versioning Standards (SemVer)
- **MAJOR:** Structural changes or compatibility-breaking updates.
- **MINOR:** New functionalities or daily updates coming from `main`.
- **PATCH:** Urgent corrections (hotfixes) applied on top of the latest stable version.

## 9. Approval & Push Rule
- **Direct Commits:** Prohibit direct commits to protected branches (e.g., `main`). Maintain all active development in feature or fix branches.
- **Explicit Approval:** Always request **explicit user approval** before executing a `git push` for any branch or tag.
- **Mandatory Verification:** Successfully run all linting, compilation, and automated tests (e.g., `mix test`, `go test`) before executing any commit or requesting push approval.

## 10. Ephemeral Resources & Temporary Files
- **Temporary Files:** When creating files for debugging, testing, or intermediate operations, use directories ignored by Git (e.g., `/tmp` or a project-specific `tmp/` folder). Ensure any newly created temporary directories are added to the `.gitignore` to prevent accidental commitment.
- **Temporary Configurations:** Maintain project configuration integrity. Ephemeral adjustments made to resolve local environment issues (e.g., temporary port changes in `compose.yml`) must be excluded from repository commits.

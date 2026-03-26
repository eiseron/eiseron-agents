# Agent Operational Commands (Slash Commands)

This document defines standardized slash commands that AI agents must recognize and execute within Eiseron projects. These commands optimize the developer experience and ensure strict adherence to the **Eiseron Engineering Constitution**.

## 1. Core Commands

### `/prepare` (Workbench Initialization)
- **Objective:** Synchronize the local repository and prepare a new feature branch.
- **Agent Workflow:**
    1. Switch to `main`: `git checkout main`.
    2. Pull latest changes: `git pull origin main`.
    3. **Ask the User:** "What will we work on today?"
    4. Upon response, create a descriptive feature branch: `git checkout -b feature/task-name`.
    5. List relevant project files to initialize context.

### `/precommit` (Quality Assurance)
- **Objective:** Run the project's automated quality suite.
- **Agent Workflow:**
    1. Identify the project type (e.g., Phoenix, Go, Python).
    2. Execute the standardized precommit alias (e.g., `mix precommit`, `go test ./...`).
    3. Report results clearly. If errors exist, propose fixes before proceeding.

### `/sync` (Pointer Synchronization)
- **Objective:** Ensure all project pointers are up-to-date with the central SSoT.
- **Agent Workflow:**
    1. Navigate to the central `eiseron-agents` repository and `git pull`.
    2. Compare and synchronize `AGENTS.md`, `.cursorrules`, `.windsurfrules`, and other standard pointers with their respective templates.
    3. Report any discrepancies found and corrected.

### `/push` (Finalization)
- **Objective:** Validate changes and request permission to push.
- **Agent Workflow:**
    1. Run `/precommit`.
    2. If successful, summarize the changes made in the branch.
    3. **Request Explicit Approval:** "May I have your approval to push the current branch to origin?"
    4. Upon approval, execute `git push origin <branch-name>`.

### `/finish` (Workbench Cleanup)
- **Objective:** Finalize the current task and return to a clean base state.
- **Agent Workflow:**
    1. Switch to `main` in all affected repositories.
    2. Synchronize all repositories: `git pull origin main`.
    3. Verify that the working directory is clean.
    4. Report that the workstation is synchronized and ready for the next task.

---

## 2. Command Extensions
Projects may define specialized commands in their local `agents/project_specializations.md`.

## 3. Enforcement
These commands are mandatory. If a user issues a slash command, the agent must prioritize its execution according to the workflows defined above.

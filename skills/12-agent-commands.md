# Agent Operational Commands (Slash Commands)

This document defines standardized slash commands that AI agents must recognize and execute within Eiseron projects. These commands optimize the developer experience and ensure strict adherence to the **Eiseron Engineering Constitution**.

## 1. Core Commands

### `/pull` (Synchronization)
- **Objective:** Synchronize the current branch with its remote counterpart.
- **Agent Workflow:**
    1. Verify the current branch.
    2. Pull latest changes: `git pull origin <current-branch>`.
    3. Report success or any conflicts found.

### `/prepare` (Workbench Initialization)
- **Objective:** Synchronize the local repository, ensure environment integrity, and prepare a new feature branch.
- **Agent Workflow:**
    1. Switch to `main`: `git checkout main`.
    2. Pull latest changes: `git pull origin main`.
    3. **Environment Check:** 
        - Verify if required environment files (e.g., `.env`) exist based on templates (e.g., `.env.example`).
        - Propose creation/updates if missing.
    4. **Ask the User:** "What will we work on today?"
    5. Upon response, create a descriptive feature branch: `git checkout -b feature/task-name`.
    6. List relevant project files to initialize context.

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

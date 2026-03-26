# Docker & Infrastructure Standards

This document defines the containerization and infrastructure standards for Eiseron projects. Consistent environment management is critical for high-velocity AI development.

## 1. Universal Containerization
- **Rule:** Every application component must have a corresponding `Dockerfile`.
- **Development Environment:** Always provide a `compose.yml` that sets up the entire development stack (app, databases, caches, etc.).
- **Consistency:** The development environment should mirror production as closely as possible (same base images, same versions).

## 2. Dockerfile Best Practices
- **Multi-stage Builds:** Use multi-stage builds to keep production images small and secure.
- **Unprivileged Users:** Never run applications as `root` inside the container. Always create and use a dedicated user (e.g., `appuser`).
- **Standard Base Images:**
    - Elixir/Phoenix: Use official `hexpm/elixir` images.
    - Go: Use official `golang` (alpine variants for production).
    - Node.js: Use official `node` (alpine variants for production).
- **Caching:** Structure `Dockerfile` layers to maximize build cache efficiency (e.g., copy dependency manifests first).

## 3. Docker Compose for Development
- **Naming Conventions:** Use lowercase, hyphenated names for services (e.g., `web-app`, `db-postgres`).
- **Volume Mounts:** Use bind mounts for source code during development to enable hot-reloading.
- **Environment Variables:** Provide a `.env.example` file. Never commit `.env` files with real secrets.
- **Orphan Containers:** Cleanup unused containers regularly using `docker compose down --remove-orphans`.

## 4. Infrastructure as Code (IaC) Integration
- **Container Registry:** All production-ready images should be pushed to a private registry (GitHub Container Registry or equivalent).
- **Deployment:** Infrastructure for container orchestration (ECS, Kubernetes, etc.) must be defined in Terraform as per `01-architecture.md`.

## 5. Development Workflow via Docker
- **Rule:** AI agents should prefer executing commands inside the containers when possible (`docker compose exec <service> <command>`).
- **Dependencies:** Avoid installing system-level dependencies on the host. Everything required for the application should be inside the Docker environment.

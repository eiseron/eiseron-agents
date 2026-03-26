# Docker & Infrastructure Standards

This document defines the containerization and infrastructure standards for Eiseron projects. Consistent environment management is critical for high-velocity AI development.

## 1. Universal Containerization
- **Rule:** Every application component must have a corresponding `Dockerfile`.
- **Development Environment:** Always provide a `compose.yml` that sets up the entire development stack (app, databases, caches, etc.).
- **Consistency:** The development environment should mirror production as closely as possible (same base images, same versions).

## 2. Dockerfile & Image Selection

### Production Images
- **Base Images:** Prioritize **distroless** or **slim** variants (e.g., Debian-slim) for production.
- **Compatibility:** Avoid Alpine images unless specifically required by the technology (like Go), but even then, **distroless** is the preferred choice for maximum compatibility and security.
- **Multi-stage Builds:** Always use multi-stage builds to produce the final, minimal production image.

### Development Environment
- **Base Images:** Use standard **Debian-based** images for development. This ensures a rich set of development tools and better compatibility with debugging utilities.
- **Workflow:** **Avoid** creating dedicated `Dockerfile.dev` files by default. Instead, use official images directly in the `compose.yml` file. Focus on making the development environment highly optimized for developer productivity and speed, while keeping the production environment optimized for security and size separately. Only create a custom development Dockerfile if unique requirements exist that cannot be met by the official image.

### Image Best Practices
- **Arbitrary Users:** Always use arbitrary (non-root) users inside containers. **Root user is FORBIDDEN** inside containers except in extremely specific cases.

## 3. Docker Compose & Environment Management
- **Service Naming:** Service names must reflect their **function**, not the technology (e.g., use `db` instead of `postgres`, `cache` instead of `redis`).
- **Dependency Management:** Be mindful of service dependencies (`depends_on`). Only start the services absolutely necessary for the current task to avoid resource exhaustion and unnecessary overhead.
- **Home Directory Persistence:** Mount the container user's home directory into a local volume within the repository (e.g., `.docker/home`). This preserves bash history, cache, and allows for `.bashrc` customizations that stay under the developer's control.

## 4. Execution Workflow
- **Rule:** AI agents **must** use `docker compose` to execute all project commands.
- **Primary Path:** Start the necessary container(s) in the background (`docker compose up -d <service>`) and then use `docker compose exec <service> <command>` for all subsequent operations.
- **Isolation:** Avoid installing system-level dependencies on the host. Everything required for the application must be encapsulated within the Docker environment.

## 5. Infrastructure as Code (IaC) Integration
- **Container Registry:** All production-ready images should be pushed to a private registry (GitHub Container Registry or equivalent).
- **Deployment:** Infrastructure for container orchestration (ECS, Kubernetes, etc.) must be defined in Terraform as per `01-architecture.md`.

## 5. Development Workflow via Docker
- **Rule:** AI agents should prefer executing commands inside the containers when possible (`docker compose exec <service> <command>`).
- **Dependencies:** Avoid installing system-level dependencies on the host. Everything required for the application should be inside the Docker environment.

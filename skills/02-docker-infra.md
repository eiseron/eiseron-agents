## 1. Project Organization
- **Standard:** Place all Docker-related inputs (Dockerfiles, entrypoint scripts, etc.) within a `.docker/` directory in the project root.
- **Organization:** Organize these files logically, either by subdirectory (`.docker/prod/Dockerfile`) or by extension (`.docker/Dockerfile.prod`, `.docker/Dockerfile.dev`).

## 2. Dockerfile & Image Selection

### Production Images
- **Base Images:** Prioritize **distroless** or **slim** variants (e.g., Debian-slim).
- **Selection:** Favor **distroless** for maximum security and reduced footprint. Alpine is acceptable for Go binaries but second-tier compared to distroless.
- **Construction:** Use multi-stage builds to produce the final, hardened production image.

### Development Environment
- **Base Images:** Use standard **Debian-based** images. This provides a rich toolset (bash, curl, build-essential) required for efficient development.
- **Workflow:** Use official images directly in the `compose.yml` file. Create a custom development Dockerfile only when base images cannot meet specific developmental requirements.

### Security
- **Arbitrary Users:** **Always** run applications using unprivileged users. Maintain containers as non-root environments to ensure maximum security.

## 3. Docker Compose & Resource Optimization
- **Service Naming:** Name services according to their **function** (e.g., `db`, `cache`, `api`) rather than the underlying technology.
- **Dependency Awareness:** Start only the services required for the specific task at hand to conserve system resources and ensure stability.
- **Home Persistence:** Map the container user's home directory to `.docker/home` within the repository to preserve bash history, caches, and custom shell configurations.

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

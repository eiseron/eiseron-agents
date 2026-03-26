# Testing & BDD Standards

This document defines the testing strategy and quality assurance standards for Eiseron projects. Reliable automated testing is the foundation of our high-velocity development cycle.

## 1. Test-Driven Development (TDD)
- **Rule:** AI agents should prefer writing tests before implementing the actual logic.
- **Workflow:** Red (fail) -> Green (pass) -> Refactor.
- **Goal:** Ensure every feature is covered by at least one failing test case before implementation.

## 2. The Testing Pyramid
We strictly follow the **Testing Pyramid** principle to ensure a balanced and efficient test suite:
1. **Unit Tests (Base):** The majority of tests. Fast and isolated.
2. **Integration Tests (Middle):** Test interactions between components and services.
3. **End-to-End (E2E) Tests (Apex):** Limited to critical business flows. Slower but high confidence.

## 3. Behavior Driven Development (BDD)
- **Focus:** Focus on the *behavior* of the system from the user's perspective rather than individual implementation details.
- **Syntax:** Use Given-When-Then patterns where appropriate in test descriptions.
- **Tools:**
    - Elixir: Use `ExUnit`. For complex user flows, use `Phoenix.LiveViewTest` for fast, headless behavioral testing.
    - Go: Use the standard `testing` package with assertions libraries if necessary.

## 4. Test Categories

### Unit Tests
- **Scope:** Isolate functions or modules.
- **Speed:** Ensure tests are extremely fast. Prioritize dependency injection or state management over mocks/stubs, using them only when necessary for external dependencies.

### Integration Tests
- **Scope:** Test the interaction between multiple modules or services (e.g., App + Database).
- **Rule:** Every API route or LiveView page must have at least one integration test covering the primary "Happy Path".

### End-to-End (E2E) Tests
- **Scope:** Test the entire system as a black box.
- **Strategy:** Limit E2E tests to critical business flows (e.g., user signup, payment, core monitoring alert).

## 5. Writing Clean Tests
- **Descriptive Names:** Test names should clearly state the expected behavior (e.g., `test "increments counter when button is clicked"`).
- **Isolation:** Maintain test independence. Ensure each test is responsible for its own state.
- **Setup/Teardown:** Use proper hooks for database cleanup and mock initialization. In Elixir, leverage `DataCase` and `ConnCase` for predictable state.

## 6. Quality Metrics
- **Coverage:** Aim for high coverage on critical business logic, but prioritize testing *meaningful behaviors* over hitting 100% line coverage on trivial code.
- **Performance:** If a test suite becomes slow, investigate and optimize. Slow tests lead to skipped tests.
- **Consistency:** Use `mix test` (Elixir) and `go test` (Go) as the standard entry points.

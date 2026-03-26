# Frontend & Styling Standards

This document defines the frontend development and styling standards for Eiseron projects. We prioritize simplicity, maintainability, and control over external dependencies.

## 1. Pure CSS over Frameworks
- **Requirement:** **Always use Pure CSS** for all styling needs. Avoid utility-first frameworks like Tailwind, Bootstrap, or other CSS-in-JS libraries.
- **Rationale:**
    - **Self-Reliance:** Maintain full ownership of the styling architecture without dependency on external third-party tool lifecycles.
    - **Performance:** Ensure minimal bundle sizes by delivering only the CSS required for the specific application.
    - **Standardization:** Leverage the native power and documentation of modern CSS (Grid, Flexbox, Variables), which provides a stable and future-proof foundation.
    - **Maintainability:** Use semantic CSS classes to ensure clean, readable HTML structure.

## 2. Component-Driven Development (CDD)
- **Strategy:** Enforce **Component-Driven Development** for all UI construction. Organize components logically within the following structure:
    - `components/ui` (or `base`): Pure, atomic components (e.g., Buttons, Inputs, Checkboxes). These must be free of business logic and highly reusable across the application.
    - `components/features` (or `modules`): Logic-rich components (e.g., `LoginForm`, `UserCard`, `ProductGrid`). These combine multiple UI components and handle specific business or state logic.
    - `components/layout`: Structural components (e.g., `Navbar`, `Sidebar`, `Footer`). These define the global or regional grid structure of the pages.

## 3. Semantic HTML & Accessibility
- **Rule:** **Always** use Semantic HTML elements (`<header>`, `<main>`, `<footer>`, `<article>`, `<nav>`, etc.) to provide meaning to the structure.
- **Accessibility (A11y):** Accessibility is a first-class citizen.
    - Ensure proper heading hierarchy (H1 -> H2 -> H3).
    - Use `aria-*` attributes where necessary.
    - Ensure all interactive elements are keyboard-accessible.
    - Maintain high color contrast for readability.
    - Convey information through multiple channels (text, icons, patterns), ensuring clarity for all users.

## 4. Styling Principles
- **Semantic Classes:** Use meaningful class names that describe the *purpose* of the element, not its appearance.
- **CSS Variables:** Use CSS variables (Custom Properties) for theme colors, spacing, and typography to ensure consistency and easy updates.
- **Mobile First:** Always design for mobile first and use media queries to enhance the layout for larger screens.
- **Animations:** Use CSS animations for simple transitions and micro-interactions. Keep them subtle and performant.

## 5. Framework Integration
- **Phoenix LiveView:** As per `01-architecture.md`, we use Phoenix LiveView to manage state and DOM updates. CSS should be structured to complement LiveView's component model.
- **Minimal JavaScript:** Only use custom JavaScript for features that cannot be easily achieved with CSS or LiveView hooks.

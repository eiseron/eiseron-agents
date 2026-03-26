# Frontend & Styling Standards

This document defines the frontend development and styling standards for Eiseron projects. We prioritize simplicity, maintainability, and control over external dependencies.

## 1. Pure CSS over Frameworks
- **Policy:** We **prefer Pure CSS** over utility-first frameworks like Tailwind, Bootstrap, or other CSS-in-JS libraries.
- **Rationale:**
    - **Self-Reliance:** We avoid being held hostage by external tools or their breaking changes.
    - **Performance:** Full control over bundle sizes. We only include the CSS we actually use.
    - **Capability:** Modern CSS is powerful and well-documented. It offers features (Grid, Flexbox, Variables) that cover almost all layout and styling needs.
    - **Maintainability:** Semantic CSS classes make the HTML cleaner and more readable compared to utility-class soup.

## 2. Semantic HTML & Accessibility
- **Rule:** **Always** use Semantic HTML elements (`<header>`, `<main>`, `<footer>`, `<article>`, `<nav>`, etc.) to provide meaning to the structure.
- **Accessibility (A11y):** Accessibility is a first-class citizen.
    - Ensure proper heading hierarchy (H1 -> H2 -> H3).
    - Use `aria-*` attributes where necessary.
    - Ensure all interactive elements are keyboard-accessible.
    - Maintain high color contrast for readability.
    - Never rely on color alone to convey information.

## 3. Styling Principles
- **Semantic Classes:** Use meaningful class names that describe the *purpose* of the element, not its appearance.
- **CSS Variables:** Use CSS variables (Custom Properties) for theme colors, spacing, and typography to ensure consistency and easy updates.
- **Mobile First:** Always design for mobile first and use media queries to enhance the layout for larger screens.
- **Animations:** Use CSS animations for simple transitions and micro-interactions. Keep them subtle and performant.

## 3. Framework Integration
- **Phoenix LiveView:** As per `01-architecture.md`, we use Phoenix LiveView to manage state and DOM updates. CSS should be structured to complement LiveView's component model.
- **Minimal JavaScript:** Only use custom JavaScript for features that cannot be easily achieved with CSS or LiveView hooks.

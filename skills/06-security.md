# Security Standards

This document defines the security requirements and best practices for all Eiseron projects. Security is a non-negotiable part of our development lifecycle.

## 1. Authentication & Session Management
- **Opaque Tokens:** Prefer **opaque tokens** for authentication. These tokens are stored on the server side, allowing for immediate revocation and tracking of device/session details.
- **Web Authentication:** For web applications, **always** use cookies for session management. Cookies must be protected with the following attributes:
    - `Secure`: Ensures cookies are only sent over HTTPS.
    - `HttpOnly`: Prevents client-side scripts from accessing the cookie (mitigating XSS).
    - `SameSite=Lax` or `Strict`: Provides protection against Cross-Site Request Forgery (CSRF).
- **CORS:** Strictly configure Cross-Origin Resource Sharing (CORS) to allow only trusted origins.

## 2. Authorization & Access Control
- **Least Privilege:** Implement the principle of least privilege. Users and services must only have access to the specific resources required for their objective.
- **Clear Logic:** Authorization logic must be centralized, clear, and easy to audit. Avoid scattered permission checks across the business logic.

## 3. Security Testing
- **Access Verification:** **Mandatory** tests must exist to verify both successful access (permitted users) and failed access (unauthorized users) for every protected resource.
- **Negative Testing:** Always include "negative cases" in your test suite to guarantee that unauthorized actors are effectively blocked as intended.

## 4. Input Validation & Sanitization
- **Strict Validation:** Validate all incoming data against a strict schema.
- **Sanitization:** Sanitize all user-generated content before rendering to prevent Cross-Site Scripting (XSS).
- **SQL Injection:** Always use parameterized queries or trusted ORMs (like Ecto or GORM) to prevent SQL injection.

## 5. Protection & Monitoring
- **Rate Limiting:** Implement rate limiting on all public endpoints, especially authentication and sensitive data submission routes, to mitigate brute-force and DoS attacks.
- **Security Headers:** Always include standard security headers (e.g., `Content-Security-Policy`, `X-Content-Type-Options`, `Strict-Transport-Security`).
- **Encryption:** Ensure encryption in transit (TLS 1.2+) and at rest for all sensitive data. Use strong, salted hashing algorithms (e.g., Argon2, bcrypt) for passwords.
- **Audit Logging:** Maintain logs for sensitive actions (login attempts, permission changes, data exports) for security auditing.

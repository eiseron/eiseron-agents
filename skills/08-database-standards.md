# Database Standards

This document defines the naming conventions, schema design, and operational standards for databases in Eiseron projects.

## 1. Naming Conventions
- **Identifiers:** Use `snake_case` for all database objects (tables, columns, indexes, constraints).
- **Table Names:** Use **plural** nouns (e.g., `users`, `invoices`, `product_categories`).
- **Primary Keys:** **Always** use **UUIDs** (universally unique identifiers) for primary keys to ensure global uniqueness and prevent information leakage. The column name must be `id`.
- **Foreign Keys:** Use the singular table name followed by `_id` (e.g., `user_id`, `invoice_item_id`).

## 2. Auditing & Lifecycle
- **Timestamps:** Every table must include the following UTC timestamps:
    - `inserted_at`: The time the record was created.
    - `updated_at`: The time the record was last modified.
- **Deletions:** Prefer **Soft Deletes** (e.g., a `deleted_at` timestamp) for critical business data. Hard deletes should be reserved only for transient data or when strictly required by data privacy regulations (e.g., GDPR).

## 3. Schema Management
- **Migrations:** All schema changes must be applied via **migrations** that are version-controlled within the application repository.
- **Consistency:** Never perform manual schema modifications in production. Every update must be buildable and repeatable through the automation pipeline.

## 4. Data Design
- **Constraints:** Leverage database-level constraints (Unique, Not Null, Check, Foreign Key) to ensure data integrity beyond the application layer.
- **Performance:** Create indexes for column sets that are frequently used in `WHERE`, `JOIN`, or `ORDER BY` clauses. Monitor query performance and optimize as needed.
- **Sensitive Data:** Encrypt sensitive data at rest. Never store plain-text passwords or PII (Personally Identifiable Information) without appropriate hashing or encryption.

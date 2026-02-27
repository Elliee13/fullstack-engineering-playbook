# Audit Logging

This doc defines how to track important changes for security and debugging.

## What to audit (minimum)
- Auth events: login, logout, MFA changes, password reset
- Permission changes: role changes, invites, admin actions
- Money-critical events: payments, refunds, credits changes
- Data lifecycle: deletes (soft/hard), exports

## Audit record fields (recommended)
- `id`
- `actor_user_id` (who did it)
- `actor_type` (user/system)
- `action` (string enum)
- `resource_type`
- `resource_id`
- `metadata` (json, no secrets)
- `ip` (if available)
- `user_agent` (if available)
- `created_at`

## Rules
- Audit logs are append-only (no updates/deletes).
- Don’t store secrets or full PII in metadata.
- Make audit logs queryable by admins (with strict access control).
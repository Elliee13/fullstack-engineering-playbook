# Backend Standards

## API design
- REST or GraphQL basics (choose one per system; avoid mixing casually)
- Resource modeling, pagination, filtering, sorting
- Idempotency for charge/create-order endpoints
- Versioning strategy (URL or header), backward compatibility
- Consistent error format, correlation/request IDs

## AuthN/AuthZ
- Authentication: sessions vs JWTs (know tradeoffs)
- Authorization: RBAC/ABAC, policy checks, deny-by-default
- Token hygiene: short-lived access, refresh rotation, revocation strategy
- Passwords: argon2/bcrypt, rate limiting, lockouts, breached password checks
- MFA basics (TOTP, WebAuthn awareness)
- Honeypots: bot signal only (not primary defense)

## Cross-cutting concerns
- Input validation at boundaries (schema validation)
- Rate limiting + abuse prevention
- Background jobs/queues (emails, webhooks, long tasks)
- Webhooks: signing, replay protection, retries
- Logging/metrics/tracing, structured logs, PII scrubbing
- Feature flags + config management
- Secrets management (never ship secrets to clients)

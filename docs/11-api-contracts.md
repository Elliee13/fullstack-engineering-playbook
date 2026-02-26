# API Contracts & Conventions

## General rules
- Be consistent: naming, pagination, errors, status codes.
- Prefer explicit types: OpenAPI or typed contracts.
- Use request IDs for debugging.

## Standard headers
- `X-Request-Id`: client may set; server echoes or generates
- `Idempotency-Key`: required for money/critical writes
- `Cache-Control` / `ETag`: for cacheable resources

## Error format (recommended)
Return consistent JSON errors:

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Invalid request",
    "details": [{ "field": "email", "issue": "invalid_format" }],
    "request_id": "..."
  }
}

Status code guidelines

200 OK: successful read/update
201 Created: new resource created
204 No Content: successful with no body
400 Bad Request: validation errors
401 Unauthorized: not authenticated
403 Forbidden: authenticated but not allowed
404 Not Found: missing resource (avoid leaking existence when sensitive)
409 Conflict: uniqueness/idempotency conflict
429 Too Many Requests: rate limit
5xx: server errors (log with request_id)

Pagination
Cursor-based (preferred at scale)

Request:
?limit=50&cursor=...

Response:

{
  "data": [...],
  "page": {
    "next_cursor": "..."
  }
}

Offset-based (ok for small datasets)
?limit=50&offset=0

Filtering & sorting
    Filtering: ?status=active&type=premium
    Sorting: ?sort=created_at&order=desc

Idempotency
For “create order / charge money / create payment intent”:

    Client sends Idempotency-Key
    Server stores key + result
    Replays return same result, not duplicate side effects

Versioning
If you need versioning:

    URL: /v1/... (simple)
    Or header-based: Accept: application/vnd.app.v1+json
    Default: avoid versioning until you have external consumers.


---

# docs/12-testing-strategy.md
```md
# Testing Strategy

## Goals
- Catch regressions early
- Protect critical flows
- Keep tests maintainable

## Recommended test pyramid
1) Unit tests (fast, small scope)
2) Integration tests (API + DB)
3) E2E tests (few, critical paths)

## Minimum bar by project size
### Small apps
- Unit tests for business logic
- Integration tests for auth + one core CRUD flow
- 1–3 E2E tests (login + main happy path)

### Medium apps
- Integration tests for each module
- E2E: happy path + 1–2 critical edge cases

### Large apps
- Contract tests for services
- E2E only for business-critical journeys
- Performance tests for hot endpoints

## What to test (high ROI)
- Auth: login/session/JWT refresh
- AuthZ: access control (IDOR prevention)
- Data integrity: constraints and invariants
- Payment/webhooks: signature verification and idempotency
- File uploads: allowed types/sizes, private access
- Migrations: backward compatibility of API during deploy

## Test data strategy
- Use factories/fixtures
- Reset DB state per test suite (transaction rollback or test DB)
- Avoid brittle data coupling across tests

## Mocking rules
- Don’t mock your own business logic
- Mock external services (Stripe/email/SMS) at boundaries
- Prefer local “fake” implementations for integration tests when possible

## CI expectations
- Run unit + integration tests on PR
- Run E2E on main branch or nightly if slow
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
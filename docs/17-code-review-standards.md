# Code Review Standards

## PR hygiene
- Keep PRs small and focused
- Include screenshots for UI changes
- Include “How to test” steps

## Reviewer checklist
Security:
- AuthZ enforced (deny by default)
- No secrets in client or repo
- No PII/tokens in logs

Correctness:
- Validation at boundaries
- Error handling (expected vs unexpected)
- Idempotency for critical writes

DB:
- Migration safe (additive first)
- Indexes match query patterns
- Constraints enforce invariants

Performance:
- Avoid N+1
- Reasonable caching headers if applicable

Testing:
- Tests added/updated for critical changes

## Definition of Done (DoD)
- [ ] Feature works end-to-end
- [ ] Tests pass
- [ ] Observability added for critical flows
- [ ] Docs updated if behavior changed
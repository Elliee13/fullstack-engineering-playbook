# Release Management

This doc defines how to safely ship changes and recover quickly if something goes wrong.

## Release strategy options
### 1) Direct release (small changes)
- Merge → deploy → verify

Use when:
- No schema changes
- Low risk
- Easy rollback

### 2) Feature-flagged release (recommended default)
- Deploy code behind a flag
- Enable flag gradually
- Easy rollback by disabling flag

Use when:
- UX changes
- New logic paths
- Partial rollout desired

### 3) Migration-first / two-phase release (schema changes)
- Phase 1: additive DB migration + backward-compatible code
- Phase 2: switch reads/writes + cleanup later

Use when:
- Columns/tables change
- Backfills needed

---

## Pre-release checklist
- [ ] All required CI checks pass (lint/typecheck/tests)
- [ ] Security review: no secrets, no token/PII logs
- [ ] Observability: key logs/metrics exist
- [ ] Migration plan reviewed (if any)
- [ ] Rollback plan documented
- [ ] Feature flag ready (if used)

## Rollout steps (recommended)
1) Deploy to staging
2) Smoke test (happy path + one edge case)
3) Deploy to production
4) Enable feature flag gradually (if used)
5) Monitor errors/latency
6) Confirm acceptance criteria in production

## Rollback options
- Disable feature flag (fastest)
- Roll back deployment (if safe)
- Forward-fix (when rollback is risky due to migrations)

## Post-release verification (10–30 min)
- [ ] Error rate normal
- [ ] Latency normal
- [ ] Key user flow works end-to-end
- [ ] No spikes in auth failures
- [ ] No spikes in DB errors/locks

## Release notes (internal)
- What changed:
- Risk areas:
- Monitoring focus:
- Rollback instructions:
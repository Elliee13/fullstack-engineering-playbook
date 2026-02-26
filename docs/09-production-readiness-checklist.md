# Production Readiness Checklist

## Security
- No secrets in client; service keys server-only
- Rate limits enabled on auth + writes
- Secure cookies / token rotation configured
- CSP/security headers configured
- RLS/policies tested (if used)

## Data & DB
- Migrations run safely
- Constraints in place for invariants
- Backups + PITR enabled
- Restore procedure documented (at least basic)

## Reliability
- Health checks live
- Timeouts + retries sensible
- Monitoring + alerts on error rate and latency

## Product correctness
- Critical flows tested (signup/login, core CRUD, payments if any)
- E2E tests for happy path
- Analytics/events (if needed) don’t leak PII

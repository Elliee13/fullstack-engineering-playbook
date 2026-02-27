# Security Testing

## Automated (recommended)
- Dependency scanning (Dependabot/Snyk)
- Secret scanning (GitHub secret scanning)
- Linting for unsafe patterns

## Manual checklist (lite)
- Check IDOR: cannot access other users’ resources
- Verify CSRF protections if cookie auth is used
- Verify file upload restrictions (type/size/private)
- Verify webhooks: signature + idempotency
- Verify logs: no tokens/PII

## Before production
- Rotate any test keys
- Confirm least privilege for DB/buckets
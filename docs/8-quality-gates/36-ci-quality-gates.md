# CI Quality Gates (Standards)

This doc defines minimum checks that must pass before merging/deploying.

## Required checks (minimum)
- Lint (frontend + backend)
- Typecheck (TS) / static checks (backend)
- Unit tests
- Integration tests (at least API + DB for critical flows)
- Build passes (web + api)
- Dependency scanning (SCA) recommended
- Secret scanning enabled

## Branch protection (teams)
Recommended:
- Require PR reviews (1–2)
- Require status checks to pass
- Require linear history (optional)
- Restrict force pushes

## CI performance rules
- Keep PR checks fast (<10 min if possible)
- Push slower suites (full e2e/perf) to nightly runs

## When to require E2E on PR
Require E2E on PR when:
- core auth flow changes
- payment/checkout changes
- migrations affecting critical flows
Otherwise allow nightly/main-branch.

## Artifact rules
- Store build artifacts/logs for debugging
- Upload test reports if available
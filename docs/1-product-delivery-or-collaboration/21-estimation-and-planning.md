# Estimation & Planning

This doc defines a simple process for turning a spec into an executable plan.

## Estimation principles
- Estimate *uncertainty*, not just effort.
- If something is unclear, call it out as a risk, don’t guess quietly.
- Prefer splitting work until tasks are “1–2 day” sized.

## Task breakdown template
Break into:
- Frontend
- Backend
- Database
- Infra/DevOps
- Testing
- Docs

Each task should have:
- Outcome (what’s done)
- Dependencies
- Test plan
- Owner (for teams)

## Effort sizing (simple)
Use T-shirt sizes:
- XS: < half day
- S: 1 day
- M: 2–3 days
- L: 1 week
- XL: split it (or write a deeper design)

## Risk list (always include)
Common risks:
- Data migrations/backfills
- AuthZ edge cases (IDOR)
- Performance on large lists/search
- Third-party API reliability
- Rollback complexity

Template:
- Risk:
- Impact:
- Mitigation:
- Trigger/signals:

## Milestones (example)
- Milestone 1: Schema + API scaffolding
- Milestone 2: Core UX + happy path
- Milestone 3: Edge cases + error states
- Milestone 4: Observability + hardening
- Milestone 5: Release + post-release verification

## Definition of Done (DoD)
A feature is done when:
- [ ] Acceptance criteria met
- [ ] AuthZ verified (deny by default)
- [ ] Validation at boundaries
- [ ] Tests added/updated
- [ ] Migrations safe + applied
- [ ] Logs/metrics added for critical flows
- [ ] Documentation updated
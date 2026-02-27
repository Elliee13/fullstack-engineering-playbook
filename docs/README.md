# Docs

This folder contains the standards, playbooks, and checklists used to build production-grade full-stack systems.

## Start here
1) **How to use this playbook:** [00-how-to-use-this-playbook.md](00-how-to-use-this-playbook.md)  
2) **Kickoff every project:** [08-project-kickoff-checklist.md](08-project-kickoff-checklist.md)  
3) **Before shipping:** [09-production-readiness-checklist.md](09-production-readiness-checklist.md)

---

## Core standards (use constantly)
- Frontend: [01-frontend-standards.md](01-frontend-standards.md)
- Backend: [02-backend-standards.md](02-backend-standards.md)
- Database: [03-database-standards.md](03-database-standards.md)
- Storage/Caching/Search: [04-storage-caching-search.md](04-storage-caching-search.md)
- Security baseline: [06-security-baseline.md](06-security-baseline.md)
- Default stack: [07-default-stack.md](07-default-stack.md)
- Repo file architecture: [19-repo-file-architecture.md](19-repo-file-architecture.md)

---

## Architecture & engineering playbooks
- Architecture defaults: [10-architecture-defaults.md](10-architecture-defaults.md)
- API contracts: [11-api-contracts.md](11-api-contracts.md)
- Testing strategy: [12-testing-strategy.md](12-testing-strategy.md)
- Migrations & safe deploys: [13-migrations-and-safe-deploys.md](13-migrations-and-safe-deploys.md)
- Observability & incidents: [14-observability-and-incidents.md](14-observability-and-incidents.md)
- Privacy & data retention: [15-privacy-data-retention.md](15-privacy-data-retention.md)
- Supabase golden path: [16-supabase-golden-path.md](16-supabase-golden-path.md)
- Code review standards: [17-code-review-standards.md](17-code-review-standards.md)
- Threat model (lite): [18-threat-model-lite.md](18-threat-model-lite.md)

---

## Topic folders (deeper playbooks)

### 1) Product delivery & collaboration
- Folder: [1-product-delivery-or-collaboration/](1-product-delivery-or-collaboration/)

### 2) Environment & configuration
- Folder: [2-environment-&-configuration-standards/](2-environment-&-configuration-standards/)

### 3) Architecture Decision Records (ADRs)
- Folder: [3-architecture-decision-records/](3-architecture-decision-records/)

### 4) Backend operational hardening
- Folder: [4-backend-operational-hardening/](4-backend-operational-hardening/)

### 5) Data lifecycle & governance
- Folder: [5-data-lifecycle-&-governance/](5-data-lifecycle-&-governance/)

### 6) Frontend “real app” standards
- Folder: [6-frontend-realapp-standards/](6-frontend-realapp-standards/)

### 7) Security depth
- Folder: [7-security-depth/](7-security-depth/)

### 8) Quality gates
- Folder: [8-quality-gates/](8-quality-gates/)

---

## Suggested reading paths

### Starting a new project
1) [Kickoff checklist](08-project-kickoff-checklist.md)
2) [Repo architecture](19-repo-file-architecture.md)
3) Core standards (01–04, 06–07)
4) [Production readiness](09-production-readiness-checklist.md)

### Shipping safely (DB + deploy heavy changes)
- [Migrations & safe deploys](13-migrations-and-safe-deploys.md)
- [Data migrations & backfills](5-data-lifecycle-&-governance/)
- [Release management](1-product-delivery-or-collaboration/)

### API-heavy work
- [Backend standards](02-backend-standards.md)
- [API contracts](11-api-contracts.md)
- [Webhooks & queues](4-backend-operational-hardening/)
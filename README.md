# Full-Stack Engineering Playbook

A practical, reusable set of standards and checklists for building production-grade systems.
Written to be useful for both solo developers and teams.

## What’s inside
- Standards: frontend, backend, database, storage/caching, DevOps, security
- Checklists: project kickoff + production readiness
- Examples: Supabase RLS templates

## How to use
1) Start every project with: **docs/08-project-kickoff-checklist.md**
2) Build using the standards in `docs/01`–`docs/07`
3) Before shipping, run: **docs/09-production-readiness-checklist.md**

## Contents
Use this indexing below for easy navigation of the contents

- [How to use this playbook](docs/00-how-to-use-this-playbook.md)
- [Frontend standards](docs/01-frontend-standards.md)
- [Backend standards](docs/02-backend-standards.md)
- [Database standards](docs/03-database-standards.md)
- [Storage, caching, search](docs/04-storage-caching-search.md)
- [DevOps & reliability](docs/05-devops-reliability.md)
- [Security baseline](docs/06-security-baseline.md)
- [Default stack](docs/07-default-stack.md)
- [Project kickoff checklist](docs/08-project-kickoff-checklist.md)
- [Production readiness checklist](docs/09-production-readiness-checklist.md)
- [Architecture Defaults](docs/10-architecture-defaults.md)
- [Api Contracts](docs/11-api-contracts.md)
- [Testing Strategy](docs/12-testing-strategy.md)
- [Migrations & Safe Deploys](docs/13-migrations-and-safe-deploys.md)
- [Observability & Incidents](docs/14-observability-and-incidents.md)
- [Privacy Data Retention](docs/15-privacy-data-retention.md) 
- [Supabase Golden Path](docs/16-supabase-golden-path.md)
- [Code Review Standards](docs/17-code-review-standards.md)
- [Threat Model Lite](docs/18-threat-model-lite.md)
- [Repo File Architecture](docs/19-repo-file-architecture.md)

 
Product Delivery or Collaboration
- [Requirements & Specs](docs/1-product-delivery-or-collaboration/20-requirements-and-specs.md)
- [Estimation and Planning](docs/1-product-delivery-or-collaboration/21-estimation-and-planning.md)
- [Release Management](docs/1-product-delivery-or-collaboration/22-release-management.md)

Environment & Configuration Standards
- [Environment and Configuration](docs/2-environment-&-configuration-standards/23-environment-and-config.md)

Architecture Decision Records
- [Monorope Structure](docs/3-architecture-decision-records/0001-monorepo-structure.md)

Backend Operational Records
- [Background Jobs & Queries](docs/4-backend-operational-hardening/24-background-jobs-and-queues.md)
- [Webhooks Playbook](docs/4-backend-operational-hardening/25-webhooks-playbook.md)
- [Caching Standards](docs/4-backend-operational-hardening/26-caching-standards.md)

Data Lifecycle & Governance
- [Privacy Data Retention](docs/5-data-lifecycle-&-governance/15-privacy-data-retention.md)
- [Audit Logging](docs/5-data-lifecycle-&-governance/27-audit-logging.md)
- [Data Migrations and Blackfills](docs/5-data-lifecycle-&-governance/28-data-migrations-and-backfills.md)
- [Data Export Import](docs/5-data-lifecycle-&-governance/29-data-export-import.md)

## Philosophy
- Prefer simple systems first; scale complexity only when needed.
- Security and correctness are not optional.
- Make decisions explicit (auth style, data ownership model, scale level).

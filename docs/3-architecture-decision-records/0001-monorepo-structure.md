# ADR-0001: Use a Monorepo Structure for Web + API

## Status
Accepted

## Context
We want consistent tooling, shared contracts, and aligned release workflows between the Next.js frontend and API backend.

## Decision
Use a monorepo layout with `apps/web`, `apps/api`, and shared packages under `packages/` (contracts/config/ui).

## Alternatives Considered
- Separate repos for web and api (simpler isolation, but harder shared contracts)
- Backend-only repo with BFF (not suitable for our team workflow)

## Consequences
- Easier shared tooling and type-safe contracts
- Requires workspace tooling (pnpm/yarn/npm workspaces)
- CI must handle multi-app changes efficiently
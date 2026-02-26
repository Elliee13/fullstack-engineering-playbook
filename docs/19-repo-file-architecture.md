# Repo & File Architecture Standard (Next.js App Router + Separate Backend)

This standard targets:
- Frontend: Next.js (App Router) + TypeScript
- Backend: separate API service (FastAPI / Nest / Express)
- Optional: shared contracts package for types/API clients

---

## 1) Top-level repo layout (monorepo recommended)

repo/
  apps/
    web/                      # Next.js app
    api/                      # backend API service
    worker/                   # optional background jobs
  packages/
    contracts/                # shared API contracts/types (recommended)
    ui/                       # optional shared UI components
    config/                   # shared lint/tsconfig/prettier
  infra/
    docker/                   # dev compose, local infra
    migrations/               # optional if DB migrations not in api/
  docs/
  .github/

### Rules
- Each app is independently deployable.
- Shared code only goes in `packages/` (never import across `apps/` directly).
- Keep “product docs” in `/docs`, not inside code folders.

---

## 2) Frontend (Next.js App Router) structure

apps/web/
  app/
    (public)/
      page.tsx
    (auth)/
      login/page.tsx
      register/page.tsx
    (app)/
      layout.tsx              # authenticated layout
      dashboard/page.tsx
      settings/page.tsx
    api/                      # only if using Next route handlers (optional)
    layout.tsx
    globals.css
  src/
    features/
      profile/
        components/
        hooks/
        api.ts                # calls backend endpoints for this feature
        schemas.ts            # Zod schemas (forms + parsing)
        types.ts
        index.ts
      items/
        components/
        hooks/
        api.ts
        schemas.ts
        types.ts
        index.ts
    components/
      ui/                     # dumb reusable primitives (buttons, inputs)
      shared/                 # shared composed components (Navbar, Modals)
    lib/
      http/
        client.ts             # fetch wrapper (baseURL, headers, retries)
        errors.ts             # API error normalization
      auth/
        session.ts            # reading session, guards, helpers
      env.ts                  # runtime-safe env access
      utils.ts
    hooks/
    styles/
    types/
  public/
  tests/
    e2e/
    integration/

### Frontend rules (important)
- **Feature-first**: most logic lives in `src/features/<feature>/...`
- `components/ui` = presentational primitives only
- `lib/http/client.ts` is the single place you configure base URL, auth header injection, error mapping
- Prefer server components by default; use `"use client"` only where needed (forms, interactive UI)
- One API pattern: each feature has its `api.ts` + `schemas.ts`

---

## 3) Backend (separate API service) structure

apps/api/
  src/
    main.*                    # bootstrap server
    config/
      env.*
      logging.*
      settings.*
    common/
      db/
        session.*             # DB session / connection pool
        migrations/           # if using in-app migrations
      http/
        responses.*           # standard response helpers
        errors.*              # error format + exception mapping
      security/
        auth.*                # JWT/session verification
        rate_limit.*          # rate limit middleware
      observability/
        logging.*
        metrics.*
        tracing.*
    modules/
      auth/
        routes.*
        service.*
        schema.*              # request/response validation
        repository.*
      users/
        routes.*
        service.*
        schema.*
        repository.*
      items/
        routes.*
        service.*
        schema.*
        repository.*
    integrations/
      email/
      payments/
      storage/
    jobs/                     # background jobs (optional)
  tests/
    unit/
    integration/
  migrations/                 # if using migration tool like Alembic/Prisma/etc

### Backend rules (important)
- Controllers/routes are thin: validate → call service → return
- Business logic in `service.*`
- DB access in `repository.*` (no SQL in controllers)
- `common/http/errors.*` defines the ONE error format returned everywhere
- AuthZ is centralized (RBAC/ABAC policies live with the module)

---

## 4) Shared contracts (recommended for teams)

packages/contracts/
  openapi.yaml                 # source of truth (or generated)
  ts/
    client/                    # generated API client
    types/                     # shared DTOs/types
  README.md

### Rules
- Backend publishes OpenAPI spec
- Frontend consumes generated client/types
- Prevents “frontend/backend mismatch” bugs

---

## 5) Naming conventions (keep consistent)
- Folders: `kebab-case`
- TS files: `camelCase.ts` or `kebab-case.ts` (pick one and stick to it)
- Feature folders: `features/<domain>` (e.g., `features/items`)
- Backend modules: `modules/<domain>`

---

## 6) Where to place common things
Frontend:
- API client wrapper: `src/lib/http/client.ts`
- Auth guards: `src/lib/auth/session.ts`
- Zod schemas: `src/features/<feature>/schemas.ts`

Backend:
- Validation schemas: `modules/<feature>/schema.*`
- Error format: `common/http/errors.*`
- Rate limiting: `common/security/rate_limit.*`

---

## 7) “Do not do this” (rules that prevent mess)
- Don’t create a giant global `utils.ts` dumping ground
- Don’t put business logic in React components
- Don’t mix DB queries into route handlers
- Don’t store secrets in the frontend env
- Don’t import `apps/api` code into `apps/web` directly (use contracts)
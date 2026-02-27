# Environment & Configuration Standards

This doc defines how configuration is handled across dev/staging/prod to avoid “works on my machine.”

## Principles
- **Config is external**: code is the same across environments.
- **Fail fast**: validate required config at startup.
- **Least privilege**: keys scoped to the minimum permissions needed.
- **No secrets in clients**: secrets only in server runtime.

## Environment tiers
- `dev`: local development
- `staging`: production-like verification
- `prod`: real users/data

Rules:
- Dev/staging/prod should be as similar as practical.
- Never point dev to prod databases.

## Naming conventions
- Use uppercase snake case: `DATABASE_URL`, `SUPABASE_URL`
- Prefix public frontend vars explicitly:
  - Next.js: `NEXT_PUBLIC_*` only for safe, public values
- Use explicit environment marker: `APP_ENV=dev|staging|prod`

## Config validation (required)
- Validate config on boot using a schema (Zod/Pydantic/etc.)
- Crash early with a clear error message when config is invalid/missing.

Minimum required config checklist:
- [ ] `APP_ENV`
- [ ] database connection settings
- [ ] auth/session/JWT secrets (server only)
- [ ] third-party API keys (server only)
- [ ] storage bucket config (if used)
- [ ] observability settings (log level, DSN, endpoints)

## Secret handling rules
- Never commit secrets to git (use secret scanning).
- Production secrets should live in:
  - Vercel/Render/Fly/etc secrets store OR
  - cloud secrets manager (AWS/GCP) OR
  - GitHub Actions secrets for CI
- Rotate keys if exposed.

## Local development
Recommended:
- `.env.example` checked in
- `.env.local` ignored by git
- Use a single command to boot dependencies (Docker Compose if needed)

## Configuration in Next.js
- Only `NEXT_PUBLIC_*` is available to the browser.
- Never expose:
  - service role keys
  - DB passwords
  - signing secrets

## Configuration in backend services
- All secrets exist only in server runtime environment.
- Separate “public config” (non-secret) from “private config” (secrets).

## Config change process (teams)
- Config change requires:
  - owner approval
  - staging verification
  - documented rollback (restore old values)
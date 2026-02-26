# Supabase Golden Path (Auth + Postgres + RLS + Storage)

## Defaults
- Postgres is the source of truth
- RLS is your “seatbelt”
- Storage buckets are private by default
- Service role keys are server-side only

## A-type apps (personal apps)
### Schema pattern
- Every user-owned table has `user_id uuid not null`
- Index: `(user_id, created_at desc)`

### RLS policies (owner-only)
- SELECT/INSERT/UPDATE/DELETE allowed only when `user_id = auth.uid()`

## B-type apps (workspaces)
### Tables
- `orgs`
- `org_members (org_id, user_id, role)`
- Domain tables include `org_id`
### Policy pattern
- Allow access if user is a member of org_id
- Additional checks for role-based permissions

## Storage (buckets)
- Prefer private buckets
- Use signed URLs for uploads/downloads
- Validate file size/type client-side; enforce server-side where possible
- Consider virus scanning for risky uploads (public user uploads)

## Edge Functions (use when needed)
Use for:
- Webhooks (Stripe, etc.)
- Secrets usage (3rd-party APIs)
- Admin actions requiring service role
- Heavy processing

Rules:
- Never expose service role key in client
- Verify webhook signatures
- Use idempotency for webhooks

## Realtime
Use when:
- chat, presence, collaborative updates
Avoid when:
- polling + caching is sufficient (keeps complexity lower)
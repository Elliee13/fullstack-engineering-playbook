# Architecture Defaults

This doc defines default architecture choices and when to introduce additional components.

## Default approach
- Start with a **modular monolith** (single backend codebase, clear module boundaries).
- Use **managed Postgres** as the primary data store.
- Add **object storage** only when you have uploads.
- Add **queues** only when work is long-running or needs retries.

## Monolith vs services (decision rules)
Stay monolith if:
- One team
- < ~10k daily active users (rough guideline)
- Few external integrations
- You can keep latency low with a single DB

Consider splitting when:
- Separate scaling needs (e.g., media processing, realtime)
- Independent deploy cadence required
- Clear bounded contexts (payments, notifications) with dedicated ownership

## Core modules (common to most apps)
- Auth (AuthN/AuthZ)
- Users/Profiles
- Domain modules (e.g., projects/items/orders)
- Notifications (email/SMS/push)
- Files/media (if uploads)
- Admin/Ops
- Observability (logging/metrics)

## When to add Redis
Add Redis when you need:
- Rate limiting at scale
- Background job queues
- Shared caching across instances
- Distributed locks

## When to add a queue
Add a queue for:
- Emails, notifications
- Webhooks retrying
- Video/image processing
- Imports/exports
- Anything > 500ms that can be async

## When DB search is not enough
Start with Postgres search (ILIKE + trigram).
Move to dedicated search when:
- Complex ranking/facets needed
- High-volume full-text search
- Search latency impacts UX

## “Money / critical actions” defaults
If payments or irreversible actions exist:
- Idempotency keys
- Audit logs
- Strong monitoring/alerts
- Webhook verification
- Server-side secrets handling only
# Caching Standards

This doc defines safe defaults for HTTP caching and server-side caching.

## Decide what you’re optimizing
- Latency (faster responses)
- Cost (avoid repeated compute)
- Load (protect DB/services)

## HTTP caching (preferred when possible)
Use for GET endpoints that are safe to cache.

### ETag default
- Generate ETag based on resource version/updated_at
- If `If-None-Match` matches: return `304 Not Modified`

### Cache-Control guidelines
- Private user data: `Cache-Control: private, max-age=0, must-revalidate`
- Public assets: `Cache-Control: public, max-age=31536000, immutable` (hashed files)

## Server-side caching (Redis/memory)
Use when:
- expensive queries
- expensive computations
- rate limiting/session storage

Rules:
- Cache keys include tenant/user scope where relevant
- TTL is mandatory
- Invalidation strategy is defined (event-driven or TTL-only)

## Invalidation strategies
- TTL-only: simplest, acceptable for non-critical freshness
- Event-driven: invalidate on writes (stronger consistency)

## “Don’t cache” list
Avoid caching when:
- responses include highly sensitive data without strong scoping
- data changes frequently and staleness breaks correctness
- cache invalidation is unknown and correctness matters
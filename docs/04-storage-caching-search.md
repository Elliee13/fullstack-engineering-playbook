# Storage, Caching, Search

## Object storage (S3/GCS/Supabase Storage)
- Pre-signed uploads/downloads
- Validate content-type + size; virus scanning for user uploads when risk warrants
- Public vs private buckets; signed URLs; lifecycle rules
- CDN in front of assets where appropriate

## Caching
- Cache-aside strategy, TTLs, invalidation patterns
- Redis basics: rate limiting, sessions, job queues, locks
- Know when not to cache (fast queries, volatile data)

## Search
- When DB is enough (ILIKE + trigram) vs dedicated search (Elastic/Meili)
- Indexing strategy and reindex workflows

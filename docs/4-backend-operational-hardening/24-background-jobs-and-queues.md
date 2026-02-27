# Background Jobs & Queues

This doc defines how to design async work safely (emails, exports, webhooks retries, media processing).

## When to use a queue
Use async jobs when:
- Work takes > ~500ms or blocks user experience
- You need retries
- You need rate control (throttling)
- You need guaranteed delivery (eventually)

## Job design rules
- Jobs must be **idempotent** (safe to run multiple times).
- Jobs must be **observable** (status, attempts, last error).
- Use **timeouts** and **retry with backoff**.
- Separate “enqueue” from “execute.”

## Retry policy (default)
- Retry on transient failures: network errors, 429, timeouts
- Do NOT retry on permanent failures: validation errors, 401/403
- Backoff example: 1m, 5m, 15m, 1h (cap)
- Max attempts: 5 (default)

## Dead-letter queue (DLQ) concept
If a job fails repeatedly:
- Move to DLQ
- Alert + provide tooling to re-run after fix

## Job payload standards
- Keep payload minimal (IDs, not entire objects)
- Validate payload schema
- Include `request_id` / `trace_id` when possible

## Minimum job table fields (if you roll your own)
- `id`
- `type`
- `payload` (json)
- `status` (queued/running/succeeded/failed)
- `attempts`
- `max_attempts`
- `run_at`
- `last_error`
- `created_at`, `updated_at`

## Monitoring (minimum)
- queue depth
- job failure rate
- average execution time
- DLQ count
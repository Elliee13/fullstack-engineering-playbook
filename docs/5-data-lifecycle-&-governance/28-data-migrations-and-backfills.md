# Data Migrations & Backfills

This doc defines how to change data safely in production.

## Golden rule
Backfills must be **restartable** and **safe to run multiple times**.

## Backfill strategy (standard)
1) Add schema changes (additive)
2) Deploy code that supports both old and new
3) Run backfill in batches
4) Verify progress and correctness
5) Switch reads to new structure
6) Cleanup old fields later

## Batch processing rules
- Process in small batches (e.g., 500–5000 rows depending on size)
- Use ordering by primary key
- Track progress (last processed id)
- Use rate limiting and sleep to reduce DB load

## Tracking (recommended)
Store a backfill status record:
- name
- started_at
- last_key
- processed_count
- status
- last_error

## Rollback strategy
- Prefer forward-fix
- If you must rollback, ensure app remains compatible with new columns
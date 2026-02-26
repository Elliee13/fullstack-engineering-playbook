# Database Standards (Relational-first)

## Schema design
- Normalize for correctness; denormalize intentionally for reads
- PK/FK, constraints (NOT NULL, CHECK), indexes
- Migrations: forward-only; safe deploy patterns
- Transactions, isolation basics, deadlocks awareness

## Queries & performance
- Read query plans; add indexes intentionally
- Avoid N+1 (especially with ORMs)
- Pagination: offset vs cursor (prefer cursor for large datasets)
- Connection pooling; avoid exhausting connections

## Security in DB
- Least privilege (separate app user vs admin user)
- RLS when you want DB-enforced row isolation (common in multi-tenant; also useful for personal apps)
- Encryption: at-rest + TLS; app-level encryption for highly sensitive fields
- Audit trails (who changed what, when)

## Data correctness
- Uniqueness constraints for invariants
- Soft delete vs hard delete; retention policies
- Timezones: store UTC; convert at edges
- Backups + PITR + restore drills

# Migrations & Safe Deploys (Postgres)

## Golden rule
Migrations must not break the running version of the app during deploy.

## Safe migration pattern (two-phase)
1) **Additive change**
   - Add new column/table with defaults nullable
   - Deploy code that writes both old and new (or writes new only but reads old)

2) **Backfill**
   - Backfill data in small batches
   - Verify correctness

3) **Switch reads**
   - Deploy code reading new structure

4) **Cleanup**
   - Make column NOT NULL, add constraints
   - Remove old columns later

## Avoid risky operations (especially on big tables)
- Adding NOT NULL without backfill
- Rewriting large tables
- Long-running locks during peak traffic

## Indexing best practices
- Add indexes that match query patterns
- Use concurrent index creation when needed (Postgres: `CREATE INDEX CONCURRENTLY`)

## Feature flags
- Gate behavior changes with flags
- Roll out safely and rollback quickly

## Migration checklist
- [ ] Migration reviewed for locks/impact
- [ ] App remains compatible during rollout
- [ ] Backfill plan exists
- [ ] Rollback plan exists (or at least forward-fix plan)
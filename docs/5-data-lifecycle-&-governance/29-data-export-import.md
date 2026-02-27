# Data Export & Import

This doc defines standard patterns for exports/imports.

## Exports
Use cases:
- user data export (privacy)
- admin exports (analytics)
- backups for customers (B2B)

Rules:
- Run exports as background jobs
- Store result in private object storage
- Generate time-limited signed download URLs
- Include an audit log entry

Preferred formats:
- CSV for tabular
- JSON for nested/structured

## Imports
Rules:
- Validate file type/size
- Parse in background job
- Provide progress + error report
- Use idempotency keys to prevent duplicate imports

## Privacy
- Ensure exports do not include other users’ data (IDOR check)
- Expire export files automatically
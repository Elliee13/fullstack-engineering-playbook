# Project Kickoff Checklist

## Decide the filters
- Auth style: sessions / JWT / both
- Data model: A personal / B workspace / C enterprise
- Uploads: yes/no
- Money/critical actions: yes/no
- Scale: small/growing/high

## Minimum baseline (always)
Frontend:
- Protected routes, server state library, form validation, error/loading/empty states

Backend:
- Validation, auth, deny-by-default authorization, consistent errors + request IDs, rate limiting

DB:
- Migrations, constraints, indexes for hot paths, backups enabled

Ops:
- CI (lint/test/build), environments, health checks, timeouts

## If uploads
- Private bucket, signed URLs, type/size validation, lifecycle rules

## If money/critical actions
- Idempotency keys
- Audit logs
- Webhook signing + replay protection
- Stronger monitoring/alerts

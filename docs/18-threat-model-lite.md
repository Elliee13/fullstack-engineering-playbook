# Threat Model (Lite)

Use this for new features or systems to catch common security issues early.

## 1) Assets (what are we protecting?)
- User accounts
- User data (PII)
- Payments/credits
- Admin privileges
- API keys/secrets

## 2) Entry points
- Web app routes
- API endpoints
- File upload endpoints
- Webhooks
- Admin panel
- Background jobs

## 3) Trust boundaries
- Browser ↔ API
- API ↔ DB
- API ↔ third-party services
- Public internet ↔ webhooks

## 4) Common threats checklist
- IDOR (insecure direct object reference): accessing other users’ data
- XSS
- CSRF (cookie auth)
- SSRF (URL fetchers)
- Injection (SQL/command)
- Token leakage (localStorage, logs)
- Broken access control (missing role checks)
- Webhook spoofing/replay

## 5) Mitigations mapping
- RLS or `WHERE user_id = ...` everywhere (IDOR prevention)
- Validation + encoding/sanitization (XSS/injection)
- Secure cookies + CSRF tokens (if cookie auth)
- Allowlist outbound fetch URLs (SSRF)
- Webhook signature + timestamp + idempotency (replay)
- Least privilege keys + secrets management (key leakage)
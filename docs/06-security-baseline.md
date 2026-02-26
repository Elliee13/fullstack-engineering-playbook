# Security Baseline

## Always
- Validate input (frontend for UX; backend for truth)
- Least privilege: API keys, DB roles, bucket policies
- Rate limit login + sensitive endpoints
- Secure cookies: httpOnly, secure, sameSite
- CSP + security headers
- Avoid SSRF primitives in URL fetchers; protect internal networks
- Keep dependencies updated; run SCA (Dependabot/Snyk)
- Log safely: no passwords/tokens/PII
- Backups + restore test

## Common “gotchas”
- Never expose service role keys to the client
- Don’t rely on CORS as security
- Don’t store long-lived tokens in localStorage

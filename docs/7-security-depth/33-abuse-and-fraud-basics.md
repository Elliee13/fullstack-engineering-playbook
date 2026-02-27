# Abuse & Fraud Basics

This doc defines basic defenses for public-facing apps.

## Common abuse patterns
- Credential stuffing
- Signup spam
- Scraping
- API abuse (high request rates)
- Content spam (uploads/forms)

## Basic defenses (minimum)
- Rate limit auth endpoints and writes
- Bot signals (honeypot fields, behavioral checks)
- Email verification (where appropriate)
- IP/user-based throttles
- CAPTCHA only if needed (avoid by default)

## Monitoring signals
- spike in 401/403
- spike in signup attempts
- unusual request rate per IP/user
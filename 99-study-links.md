# Study Links (Definitions + Practical Guides)

This page links to authoritative resources (MDN, OWASP, PostgreSQL, Supabase, GitHub Docs, Stripe) to learn the concepts used throughout the playbook.

---

## Frontend security fundamentals

### XSS (Cross-Site Scripting)
- MDN: XSS overview and defenses. :contentReference[oaicite:0]{index=0}
- OWASP: XSS Prevention Cheat Sheet (practical). :contentReference[oaicite:1]{index=1}

### CSRF (Cross-Site Request Forgery)
- OWASP: CSRF Prevention Cheat Sheet. :contentReference[oaicite:2]{index=2}
- OWASP: CSRF attack overview (quick concept). :contentReference[oaicite:3]{index=3}

### CORS (Cross-Origin Resource Sharing)
- MDN: CORS guide (how it works, preflight, headers). :contentReference[oaicite:4]{index=4}
- MDN: CORS configuration guide (practical header examples). :contentReference[oaicite:5]{index=5}

### CSP (Content Security Policy)
- MDN: CSP guide (what it is, why it matters). :contentReference[oaicite:6]{index=6}
- OWASP: CSP Cheat Sheet (practical deployment guidance). :contentReference[oaicite:7]{index=7}

---

## HTTP caching (ETag/304) and performance

### ETag + 304 Not Modified
- MDN: ETag header reference. :contentReference[oaicite:8]{index=8}
- MDN: 304 Not Modified status. :contentReference[oaicite:9]{index=9}
- MDN: HTTP caching guide (ETag + If-None-Match examples). :contentReference[oaicite:10]{index=10}
- web.dev: HTTP cache practical guidance. :contentReference[oaicite:11]{index=11}

---

## Backend API & security standards

### REST API security basics
- OWASP: REST Security Cheat Sheet. :contentReference[oaicite:12]{index=12}

### JWT (JSON Web Tokens)
- OWASP: JWT Cheat Sheet (best practices; language-agnostic concepts). :contentReference[oaicite:13]{index=13}
- OWASP WSTG: Testing JWTs (common pitfalls). :contentReference[oaicite:14]{index=14}
- IETF Draft: JWT Best Current Practices (deep/advanced). :contentReference[oaicite:15]{index=15}

### SSRF (Server-Side Request Forgery)
- OWASP: SSRF Prevention Cheat Sheet. :contentReference[oaicite:16]{index=16}

---

## Database security (RLS) and policies

### PostgreSQL Row Level Security (RLS)
- PostgreSQL docs: Row Security Policies (RLS fundamentals). :contentReference[oaicite:17]{index=17}
- PostgreSQL docs: CREATE POLICY reference (how policies are defined). :contentReference[oaicite:18]{index=18}

### Supabase RLS
- Supabase docs: Row Level Security guide (how Supabase uses it). :contentReference[oaicite:19]{index=19}

---

## Webhooks (signature verification) and reliability

### Stripe webhooks (good “reference implementation”)
- Stripe docs: Webhooks overview + signature verification. :contentReference[oaicite:20]{index=20}
- Stripe docs: Signature verification troubleshooting / raw body gotchas. :contentReference[oaicite:21]{index=21}

---

## Quality gates / CI standards (GitHub)

### GitHub Actions
- GitHub Docs: Workflow syntax (YAML reference). :contentReference[oaicite:22]{index=22}
- GitHub Docs: About workflows (high-level). :contentReference[oaicite:23]{index=23}

### Secret scanning
- GitHub Docs: About secret scanning. :contentReference[oaicite:24]{index=24}
- GitHub Docs: Enabling secret scanning. :contentReference[oaicite:25]{index=25}

### Dependabot
- GitHub Docs: Dependabot quickstart. :contentReference[oaicite:26]{index=26}
- GitHub Docs: Configuring Dependabot version updates. :contentReference[oaicite:27]{index=27}

---

## How to use this page
- If you see a term in the playbook and want a quick definition: start with MDN/OWASP.
- If you’re implementing in Postgres/Supabase: go to PostgreSQL/Supabase docs.
- If you’re implementing CI: go to GitHub Docs.
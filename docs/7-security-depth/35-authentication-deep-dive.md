# Authentication Deep Dive (Sessions vs JWT)

## Default decision rules
Use **cookie sessions** when:
- browser-first apps
- SSR pages need secure session access
- you want simpler CSRF-aware security model

Use **JWT access + refresh** when:
- mobile apps
- third-party API consumers
- multiple services need stateless auth

## JWT hygiene (if using JWT)
- short-lived access tokens
- refresh token rotation
- store refresh token securely (prefer httpOnly cookie when possible)
- revocation strategy (token versioning or allowlist/denylist)

## Logout semantics
- Sessions: invalidate server-side session
- JWT: rotate refresh token, revoke token family, or bump token version
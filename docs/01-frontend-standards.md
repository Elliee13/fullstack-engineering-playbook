# Frontend Standards

## Architecture & state
- Component architecture (composition > inheritance)
- Split UI vs logic (“smart vs dumb”)
- Client state vs server state (React Query / SWR)
- Routing + layouts + protected routes
- Forms: schema validation (Zod/Yup), controlled/uncontrolled patterns
- Error boundaries + retry UI + empty/loading states

## Security (non-negotiable)
- XSS: escape by default; sanitize rich text; avoid `dangerouslySetInnerHTML` without sanitizer
- CSRF: know when it matters (cookie auth) vs not (pure bearer tokens)
- Secure storage: avoid localStorage for long-lived tokens; prefer httpOnly cookies or short-lived access + refresh in cookie
- CORS: browser policy, not security

## Performance
- Code splitting, lazy routes, bundle analysis
- Caching: HTTP caching/ETags, stale-while-revalidate patterns
- Image optimization (sizes, formats)
- Web vitals basics (CLS/LCP/INP)

## Quality
- Type safety (TypeScript), linting/formatting
- Testing: unit + integration + e2e (Playwright/Cypress)
- Accessibility: keyboard nav, aria, contrast, focus management

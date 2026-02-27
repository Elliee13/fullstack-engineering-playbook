# Frontend Performance Playbook (Next.js)

## Measure first
- Track Web Vitals (CLS/LCP/INP)
- Run Lighthouse on key pages
- Watch bundle size for regressions

## Default performance rules
- Prefer Server Components where possible
- Keep client components small
- Lazy-load heavy routes and non-critical components
- Optimize images (Next Image, correct sizes)
- Avoid large JSON payloads; paginate and compress

## Bundle hygiene
- Avoid importing entire libraries (use per-module imports)
- Watch for duplicate deps
- Use dynamic imports for rarely-used UI

## Caching
- Use HTTP caching and revalidation appropriately
- Avoid refetch loops; use server-state caching (React Query/SWR)

## Performance checklist
- [ ] LCP improved or unchanged
- [ ] No major bundle size regression
- [ ] Images optimized
- [ ] API payload sizes reasonable
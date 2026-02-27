# Frontend Error Handling Standards

## Error taxonomy (simple)
- User-correctable: validation, missing fields
- Recoverable: network hiccup, timeout
- Non-recoverable: permissions, server errors

## UI defaults
- Always show: loading, empty, error states
- Provide retry for recoverable failures
- For permission errors: show “not allowed” and next steps
- For unknown errors: show request_id if available

## Error boundaries (React)
- Use error boundaries for unexpected render failures
- Log errors with route + request_id

## Offline/poor network basics
- Avoid blocking UI forever
- Use sensible timeouts
- Use optimistic UI only when rollback is easy
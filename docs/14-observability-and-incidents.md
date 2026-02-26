# Observability & Incidents

## What to capture (baseline)
### Logs
- Structured JSON logs
- Include: request_id, user_id (if safe), route, status, latency_ms
- Never log: passwords, tokens, secrets, full PII

### Metrics (minimum)
- Request rate
- Error rate (4xx/5xx)
- Latency (p50/p95/p99)
- DB query latency (if possible)
- Queue depth + job failures (if using queues)

### Tracing (when needed)
- Add tracing when:
  - multiple services
  - hard-to-debug latency
  - lots of external calls

## Alerting (keep it simple)
- High 5xx rate
- Latency p95 above threshold
- DB connection saturation
- Queue backlog above threshold
- Webhook failures spikes

## Incident basics
### During incident
- Identify blast radius
- Stabilize (rollback/disable feature flag)
- Communicate status
- Capture timeline and request IDs

### After incident (postmortem)
- Root cause
- Contributing factors
- Action items with owners + dates
- Prevent recurrence (tests/alerts/guards)
# Webhooks Playbook

This doc defines how to receive and process webhooks safely (Stripe, etc.)

## Non-negotiables
- Verify signature (and timestamp if supported)
- Prevent replay attacks (timestamp tolerance or nonce)
- Use idempotency so duplicates don’t cause double side effects
- Process asynchronously when work is non-trivial

## Handler flow (standard)
1) Receive webhook (raw body)
2) Verify signature
3) Parse event + validate schema
4) Store `event_id` with status (idempotency)
5) Enqueue processing job (recommended)
6) Return 2xx quickly

## Idempotency rules
- Use provider event ID as the idempotency key
- Store:
  - `provider`
  - `event_id`
  - `received_at`
  - `processed_at`
  - `status`
- If event already processed: return 2xx and exit

## Error handling
- If signature invalid: return 400 (do not retry)
- If transient failure during processing: retry via queue
- Avoid failing the HTTP webhook response if you already queued the job

## Observability
- Log `event_id`, type, request_id
- Metric: webhook received, verified, processed, failed
- Alert on spike in verification failures or processing failures
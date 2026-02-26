# Privacy, Data Handling & Retention

## Data classification (simple)
- Public: safe to display publicly
- Internal: business data, non-public
- Sensitive: PII, auth identifiers, payment-related metadata

## Principles
- Collect minimum data required
- Restrict access by least privilege
- Avoid logging sensitive data
- Encrypt in transit; rely on managed encryption at rest
- App-level encryption for highly sensitive fields if required

## Retention policies
- Define how long you keep:
  - audit logs
  - user content
  - soft-deleted records
  - backups (managed retention)

## User rights (common expectations)
- Account deletion
- Data export
- Consent for emails/marketing

## Practical checklist
- [ ] PII fields identified
- [ ] Logs scrubbed
- [ ] Deletion workflow defined (soft vs hard)
- [ ] Backup retention understood
# Evidence model

Each finding should use this structure:

```yaml
id: F-001
claim: "The app asks for location permission before starting field attendance."
status: observed # observed | inferred | unknown
confidence: high # high | medium | low
source_type: runtime # static | runtime | user-provided | external-research
source_ref: "tool evidence id, file path + digest, or capture id"
platform: android
app_id: "com.example.app"
limitations:
  - "Only the onboarding path was exercised."
```

Rules:

- `observed` means directly present in inspected evidence.
- `inferred` means a reasoned interpretation supported by evidence; explain the reasoning.
- `unknown` means the evidence is insufficient or the area was not inspected.
- `not observed` is not equivalent to `absent`.
- Keep credentials and personal data out of reports. Redact secrets and minimize copied payloads.
- Static declarations do not prove runtime execution. A runtime observation applies only to the observed app version, device/browser, account state, and scenario.

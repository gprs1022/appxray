# Roadmap

## Phase 0 — Skill and contracts (current)
- [x] Portable Agent Skill scaffold
- [x] REA integration contract and capability caveats
- [x] Android ADB package discovery MVP
- [x] Evidence model and report templates
- [ ] Validate skill in at least two compatible agents

## Phase 1 — Android MVP
- [ ] Robust package label/version parsing across Android versions/OEMs
- [ ] Interactive package selection in the host agent
- [ ] Authorized APK pull workflow with split-APK handling and clear consent
- [ ] REA tool-schema adapter and Android report generation
- [ ] Fixture-based tests; no real-device dependency in CI

## Phase 2 — Web analysis
- [ ] Browser target intake and allowed-origin scope
- [ ] Passive page/script/route inventory
- [ ] Approved scenario capture and evidence ledger
- [ ] HAR import with secret/PII redaction

## Phase 3 — iOS analysis
- [ ] IPA and source/build artifact intake
- [ ] Bundle/resource inventory
- [ ] Supported Mach-O handoff and provider detection
- [ ] Documented simulator/device limitations

## Phase 4 — Comparison and product intelligence
- [ ] Normalized feature/workflow schema
- [ ] Cross-app comparison generator
- [ ] Business feasibility assumptions and scenario calculator
- [ ] New-app blueprint and prioritization

## Phase 5 — Release quality
- [ ] CI lint and script tests
- [ ] Security and privacy review
- [ ] Agent compatibility matrix
- [ ] Versioned releases and contribution guide

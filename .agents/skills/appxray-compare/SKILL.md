---
name: appxray-compare
description: Compares two or more analyzed applications, producing a normalized capability matrix, workflow comparison, UX gaps, and architecture differences. Triggered by /appxray-compare.
---

# AppXRay: Multi-Application Comparison

Use this skill when the user runs `/appxray-compare` or asks to compare two or more applications that have been observed, decompiled, or analyzed.

## Procedure

1. **Scope Definition**:
   - Confirm which apps are in scope (names, package IDs, or URLs).
   - Ensure each app has either an existing analysis report or observed evidence ledger. Do not cross-contaminate raw evidence between apps.

2. **Comparative Dimensions**:
   - **Feature & Capability Matrix**: Tabulate capabilities using status values: `present`, `partial`, `not observed`, or `unknown`.
     *Note:* Never treat `not observed` as proof of absence.
   - **User Journeys & Workflows**: Compare onboarding friction, authentication models, core task flows, checkout/payment steps, and error recovery.
   - **Business Rules & Logic**: Compare entity states, eligibility criteria, transaction constraints, and pricing/monetization logic.
   - **Architecture & Tech Stack**: Compare frameworks (Native Kotlin/Swift vs React Native vs Flutter), backend APIs, local databases, background syncing, and third-party SDKs.
   - **UX & Design Patterns**: Contrast navigation ergonomics, visual hierarchy, micro-interactions, and accessibility clues.

3. **Synthesis & Opportunities**:
   - Identify best-in-class patterns worth emulating.
   - Highlight vulnerabilities, UX friction, and common gaps in existing market solutions.
   - Produce a final comparison deliverable following the format in `templates/comparison-report.md`.

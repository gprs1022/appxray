---
name: appxray-blueprint
description: Generates a product thesis, MVP scope, technical architecture, and economic feasibility blueprint (pricing, unit economics, break-even) for a new application. Triggered by /appxray-blueprint.
---

# AppXRay: Product & Economic Blueprint

Use this skill when the user runs `/appxray-blueprint` or asks to design a new application, product specification, MVP scope, or commercial feasibility plan based on competitive intelligence.

## Procedure

1. **Intake & Scope**:
   - Clarify the core problem, target audience, and primary competitive benchmarks (e.g. from prior `/appxray` or `/appxray-compare` analyses).

2. **Blueprint Construction**:
   - **Product Thesis**: Core problem, value proposition, and unique market wedge.
   - **MVP Scope Prioritization**: Strictly categorized into *Must-Have* (v1 launch), *Should-Have* (fast follow), and *Later* (backlog).
   - **Technical Architecture**: Recommended frontend client stack, backend services, database schema outline, API specifications, and offline/background strategies.
   - **Security & Compliance**: Storage policies, privacy considerations, and authentication architecture.
   - **Business Model & Pricing**: Monetization models (SaaS, usage-based, freemium, transactional), packaging tiers, and price elasticity hypotheses.
   - **Economic Feasibility & Scenarios**:
     - 12-month projections (Conservative, Base, Optimistic).
     - Fixed monthly operating costs (cloud hosting, APIs, distribution fees, developer support).
     - Variable per-user costs.
     - Break-even calculation:
       $$\text{Break-Even Paying Users} = \frac{\text{Monthly Fixed Costs}}{\text{Price per Customer} - \text{Variable Cost per Customer}}$$
     - Unit economics: CAC estimate, LTV formula, payback period, and target gross margin.

3. **Deliverable**:
   - Write out the comprehensive blueprint document matching the structure in `templates/new-app-blueprint.md`.

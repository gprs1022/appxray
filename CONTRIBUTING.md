# Contributing

Thanks for helping improve Android App Intelligence.

## Before opening an issue or PR

- Confirm you are working with apps/systems you own or are authorized to assess.
- Never include API keys, tokens, passwords, personal records, private APKs, or unredacted traffic captures.
- Include OS, agent, REA/MCP version, tool versions, and minimal reproduction steps.
- Distinguish observed behavior from inference and unknowns.

## Pull requests

- Keep platform-specific logic in its platform adapter/reference.
- Keep the common report schema platform-neutral.
- Do not add dependencies without explaining why and documenting installation.
- Add tests for scripts and parsers; avoid tests requiring real user devices in CI.
- Update the capability matrix whenever a claim about platform support changes.

## Scope

This project orchestrates authorized analysis; it is not a decompiler, device-management tool, mobile app store, or security certification product.

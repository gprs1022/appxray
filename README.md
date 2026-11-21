<p align="center">
  <img src="assets/logo.png" alt="AppXRay Logo" width="160" height="160">
</p>

<h1 align="center">AppXRay</h1>

<p align="center">
  <strong>Evidence-First Application Intelligence & Reverse-Engineering Plugin for Antigravity</strong><br>
  <em>Deconstruct workflows, extract business logic, compare competitors, and generate new product blueprints for Android, iOS, and Web applications.</em>
</p>

<p align="center">
  <a href="https://github.com/gprs1022/appxray"><img src="https://img.shields.io/badge/GitHub-gprs1022%2Fappxray-blue?logo=github" alt="GitHub"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-green.svg" alt="License: MIT"></a>
  <a href="plugin.json"><img src="https://img.shields.io/badge/Antigravity-Plugin%20v0.1.0-cyan.svg" alt="Antigravity Plugin"></a>
  <img src="https://img.shields.io/badge/Platforms-Android%20%7C%20iOS%20%7C%20Web-orange.svg" alt="Platforms">
</p>

---

## ⚡ Overview

**AppXRay** is an agentic intelligence plugin built specifically for **Google Antigravity**. It orchestrates evidence-backed inspection of mobile and web applications to help developers, product managers, and security researchers:

- 🔍 **Discover & Enumerate**: Detect installed third-party apps on connected Android devices/emulators with version and APK path resolution.
- 🧩 **Deconstruct Workflows**: Extract onboarding paths, authentication states, transaction flows, and hidden edge cases.
- 💼 **Reverse Business Logic**: Map actor permissions, validation rules, state machines, and monetization mechanisms.
- ⚖️ **Cross-App Comparison**: Build normalized feature matrices comparing competing products.
- 🚀 **Product Blueprinting**: Synthesize market intelligence into a production-ready MVP scope, system architecture, and economic feasibility model with break-even calculations.

---

## 🚀 Quick Start: Installation

### Option 1: Global Antigravity Plugin (Recommended)

To make AppXRay and its slash commands available across all your Antigravity workspaces:

1. Clone or copy the repository into your global plugins folder:
   ```bash
   # Windows (PowerShell)
   git clone https://github.com/gprs1022/appxray.git "$HOME\.gemini\config\plugins\appxray"
   ```
   ```bash
   # macOS / Linux (Bash)
   git clone https://github.com/gprs1022/appxray.git ~/.gemini/config/plugins/appxray
   ```
2. In Antigravity, the plugin will load automatically on your next turn. You can view and manage it anytime in your **Customizations** settings.

### Option 2: Project Workspace Plugin

To bundle AppXRay inside a specific workspace/repository:
```bash
git clone https://github.com/gprs1022/appxray.git .agents/plugins/appxray
```

---

## 🎮 Slash Commands Guide

AppXRay exposes 4 dedicated slash commands in the Antigravity chat:

| Slash Command | Purpose | When to Use |
|---|---|---|
| `/appxray` | **Full End-to-End Analysis** | Use when you want a complete, evidence-led inspection of a single app, producing an exhaustive analysis report. |
| `/appxray-discover` | **Device Package Discovery** | Use to enumerate installed 3rd-party Android apps on your connected device or emulator with versions and accessible APK paths. |
| `/appxray-compare` | **Multi-App Comparison** | Use when you have 2 or more target apps and want a normalized feature matrix, UX teardown, and competitive delta. |
| `/appxray-blueprint` | **New Product Blueprint** | Use to generate an MVP architecture, feature roadmap, pricing hypothesis, and 12-month unit economics model. |

---

## 🛠️ Step-by-Step Execution Guide

### 1. Connecting an Android Device or Emulator

1. Connect your Android device via USB (or start an Android Virtual Device via Android Studio / Device Hub).
2. Enable **Developer Options** and turn on **USB Debugging**.
3. Accept the RSA fingerprint prompt on your device screen.
4. In Antigravity, type:
   ```text
   /appxray-discover
   ```
   *AppXRay automatically runs the native discovery script (`android-discover.ps1` on Windows or `android-discover.sh` on Linux/macOS) and prints an interactive inventory table:*

   | PACKAGE | VERSION | APK_PATHS |
   |---|---|---|
   | `com.example.fitapp` | `2.4.1` | `/data/app/~~.../base.apk` |
   | `com.example.wallet` | `1.0.8` | `/data/app/~~.../base.apk;split_config.apk` |

---

### 2. Inspecting an Application

Type:
```text
/appxray
```
Provide the app package ID or APK file path. AppXRay will:
1. Verify assessment authorization and confirm the target boundary.
2. Inspect the APK structure (manifest, activities, services, permissions, network security configs).
3. If [REA](https://github.com/morluto/rea) is connected, leverage advanced decompilation tools (`inspect_android_package`, focused class/method analyzers).
4. Generate a comprehensive **Application Analysis Report** saved in your project workspace using `templates/app-analysis-report.md`.

---

### 3. Comparing Competitor Applications

Type:
```text
/appxray-compare
```
Specify the apps to contrast (e.g., `App A vs App B`). AppXRay builds:
- A standardized **Feature Matrix** (`present`, `partial`, `not observed`, `unknown`).
- Side-by-side journey comparison (Onboarding, Checkout, Error Recovery).
- UX ergonomics and friction analysis.
- Differentiator highlights and traps to avoid.

---

### 4. Creating an MVP Product Blueprint

Type:
```text
/appxray-blueprint
```
AppXRay synthesizes all observed market evidence and constructs:
- **Product Thesis**: Core value proposition and market wedge.
- **MoSCoW MVP Roadmap**: Strict categorization of *Must-Have*, *Should-Have*, and *Later*.
- **Technical Architecture**: Frontend client stack, backend services, database schema, offline caching.
- **Economic Feasibility Model**:
  - Conservative, Base, and Optimistic 12-month projections.
  - Fixed monthly operating expenses (cloud hosting, APIs, distribution).
  - Break-Even customer formula:
    $$\text{Paying Customers Needed} = \frac{\text{Monthly Fixed Costs}}{\text{Price per User} - \text{Variable Cost per User}}$$

---

## 🔌 Optional REA (Reverse Engineer Anything) MCP Integration

AppXRay integrates seamlessly with [REA (Reverse Engineer Anything)](https://github.com/morluto/rea) for advanced decompilation and class analysis:

```bash
npx rea-agents setup
```
Once configured, AppXRay automatically utilizes REA's advertised tools (`inspect_android_package`, `open_binary`, `open_bundle_resources`) when available, while preserving evidence references, digests, and confidence scores.

---

## 🛡️ Safety, Legal & Privacy Guardrails

- **Explicit Authorization Only**: Analyze only software and devices you own or are expressly authorized to assess.
- **No Sandbox Violation**: Never extracts protected `/data/data/<package>` private storage, tokens, or plaintext credentials.
- **Zero Hallucination Policy**: Every claim in an AppXRay report is tagged with:
  - `status`: `observed` | `inferred` | `unknown`
  - `confidence`: `high` | `medium` | `low`
  - `source_ref`: tool evidence ID, file path, or digest.
- **Data Redaction**: Sensitive personal records and secret tokens are redacted automatically before inclusion in reports.

---

## 📂 Plugin Structure

```text
appxray/
├── plugin.json               # Antigravity plugin manifest
├── README.md                 # User documentation & execution guide
├── LICENSE                   # Open-source MIT license
├── assets/
│   └── logo.svg              # Plugin visual branding
├── scripts/
│   ├── android-discover.sh   # Linux/macOS POSIX ADB discovery script
│   └── android-discover.ps1  # Windows native PowerShell ADB discovery script
├── skills/
│   ├── appxray/              # Main /appxray skill
│   │   ├── SKILL.md
│   │   ├── references/       # Evidence model, REA notes, capability specs
│   │   ├── scripts/          # Bundled discovery tooling
│   │   └── templates/        # Analysis, comparison, blueprint templates
│   ├── appxray-discover/     # /appxray-discover skill
│   │   ├── SKILL.md
│   │   └── scripts/
│   ├── appxray-compare/      # /appxray-compare skill
│   │   ├── SKILL.md
│   │   └── templates/
│   └── appxray-blueprint/    # /appxray-blueprint skill
│       ├── SKILL.md
│       └── templates/
```

---

## 🤝 Contributing

Contributions are warmly welcomed! Please see [CONTRIBUTING.md](CONTRIBUTING.md) for contribution guidelines and testing protocols.

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

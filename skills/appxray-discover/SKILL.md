---
name: appxray-discover
description: Discovers and enumerates installed third-party applications on connected Android devices or emulators, retrieving package IDs, version names, and accessible APK paths. Triggered by /appxray-discover.
---

# AppXRay: Device Package Discovery

Use this skill when the user runs `/appxray-discover` or asks to discover, enumerate, or list installed applications on an Android device or emulator.

## Procedure

1. **Check Prerequisites**:
   - Verify `adb` is present on the PATH.
   - Run `adb devices -l` to check whether an authorized Android device or emulator is connected.
   - If not connected, instruct the user to connect via USB or Wi-Fi, enable Developer Options & USB Debugging, and accept the RSA key prompt on the device screen.

2. **Execute Discovery**:
   - On Windows (PowerShell):
     ```powershell
     powershell -ExecutionPolicy Bypass -File ./scripts/android-discover.ps1
     ```
   - On Linux / macOS / Bash:
     ```bash
     chmod +x ./scripts/android-discover.sh
     ./scripts/android-discover.sh
     ```
   - If running directly inside the agent shell, execute `adb shell pm list packages -3` followed by querying `dumpsys package <package>` for `versionName` and `pm path <package>` for APK paths.

3. **Output & Selection**:
   - Present a clean Markdown table with:
     - Application / Package ID
     - Version Name (if resolved)
     - APK Availability (paths available or inaccessible)
   - Ask the user which app(s) they would like to inspect or analyze next using `/appxray`.

## Constraints & Guardrails
- Only query third-party packages (`-3`).
- Do not inspect system-private packages unless specifically requested and authorized.
- Never attempt to inspect or pull `/data/data/<package>` or private application sandbox databases.

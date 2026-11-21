#!/usr/bin/env bash
set -euo pipefail

if ! command -v adb >/dev/null 2>&1; then
  echo "ERROR: adb not found. Install Android Platform Tools and add adb to PATH." >&2
  exit 127
fi

if ! adb get-state >/dev/null 2>&1; then
  echo "ERROR: No authorized Android device/emulator found." >&2
  echo "Connect a device, enable USB debugging, accept the RSA prompt, then run: adb devices -l" >&2
  exit 2
fi

printf 'Connected device(s):\n'
adb devices -l
printf '\nInstalled third-party packages (best-effort metadata):\n'
printf '%-55s %-18s %s\n' 'PACKAGE' 'VERSION' 'APK_PATHS'

while IFS= read -r package; do
  [[ -z "$package" ]] && continue
  version="unknown"
  # dumpsys output differs by Android release/OEM; this is intentionally best-effort.
  version_line="$(adb shell dumpsys package "$package" 2>/dev/null | grep -m1 -E 'versionName=' || true)"
  if [[ -n "$version_line" ]]; then
    version="$(printf '%s' "$version_line" | sed -E 's/.*versionName=([^ ]+).*/\1/')"
  fi
  paths="$(adb shell pm path "$package" 2>/dev/null | sed 's/^package://' | tr '\n' ';' | sed 's/;$//' || true)"
  printf '%-55s %-18s %s\n' "$package" "$version" "${paths:-unavailable}"
done < <(adb shell pm list packages -3 2>/dev/null | sed 's/^package://' | sort)

cat <<'NOTICE'

NOTE:
- This script lists third-party package IDs, best-effort version names, and package APK paths.
- It does not pull APKs, enumerate private app data, or guarantee package labels.
- Some apps use split APKs; pm path may return multiple paths.
- Only pull APK files when you are authorized and the device permits access.
NOTICE

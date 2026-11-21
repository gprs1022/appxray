#!/usr/bin/env bash
# AppXRay 1-Click Installer for macOS & Linux
# Usage:
#   curl -fsSL https://raw.githubusercontent.com/gprs1022/appxray/main/install.sh | bash

set -euo pipefail

echo "=========================================="
echo "         AppXRay Plugin Installer         "
echo "  Application Intelligence for Antigravity"
echo "=========================================="

PLUGINS_DIR="${HOME}/.gemini/config/plugins"
TARGET_DIR="${PLUGINS_DIR}/appxray"
REPO_URL="https://github.com/gprs1022/appxray.git"

mkdir -p "${PLUGINS_DIR}"

if [ -d "${TARGET_DIR}/.git" ]; then
    echo "Updating existing AppXRay installation..."
    git -C "${TARGET_DIR}" pull --rebase
else
    if [ -d "${TARGET_DIR}" ]; then
        rm -rf "${TARGET_DIR}"
    fi
    echo "Cloning AppXRay into Antigravity plugins directory..."
    git clone "${REPO_URL}" "${TARGET_DIR}"
fi

chmod +x "${TARGET_DIR}/scripts/android-discover.sh"
chmod +x "${TARGET_DIR}/skills/appxray/scripts/android-discover.sh"
chmod +x "${TARGET_DIR}/skills/appxray-discover/scripts/android-discover.sh"

if command -v adb >/dev/null 2>&1; then
    echo "[OK] Android Debug Bridge (adb) found."
else
    echo "[INFO] adb was not found on your PATH."
    echo "       Install Android Platform Tools to enable live device inspection."
fi

echo ""
echo "Installation Complete! 🎉"
echo "AppXRay is now active in Antigravity."
echo ""
echo "Available Slash Commands:"
echo "  /appxray          - Full end-to-end application intelligence teardown"
echo "  /appxray-discover - Enumerate 3rd-party apps & APKs on connected devices"
echo "  /appxray-compare  - Side-by-side competitive matrix and UX teardown"
echo "  /appxray-blueprint - Generate product thesis, MVP roadmap & economics"

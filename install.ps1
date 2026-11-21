# AppXRay 1-Click Installer for Windows
# Usage in PowerShell:
#   irm https://raw.githubusercontent.com/gprs1022/appxray/main/install.ps1 | iex

$ErrorActionPreference = 'Stop'

Write-Host "==========================================" -ForegroundColor Cyan
Write-Host "         AppXRay Plugin Installer         " -ForegroundColor Cyan
Write-Host "  Application Intelligence for Antigravity" -ForegroundColor DarkCyan
Write-Host "==========================================" -ForegroundColor Cyan

$pluginsDir = Join-Path $HOME ".gemini\config\plugins"
$targetDir = Join-Path $pluginsDir "appxray"
$repoUrl = "https://github.com/gprs1022/appxray.git"

# 1. Ensure plugin directory exists
if (-not (Test-Path $pluginsDir)) {
    New-Item -ItemType Directory -Force -Path $pluginsDir | Out-Null
}

# 2. Clone or update repository
if (Test-Path (Join-Path $targetDir ".git")) {
    Write-Host "`nUpdating existing AppXRay installation..." -ForegroundColor Yellow
    git -C $targetDir pull --rebase
} else {
    if (Test-Path $targetDir) {
        Remove-Item -Recurse -Force $targetDir
    }
    Write-Host "`nCloning AppXRay into Antigravity plugins directory..." -ForegroundColor Green
    git clone $repoUrl $targetDir
}

# 3. Check for adb
$adb = Get-Command adb -ErrorAction SilentlyContinue
if ($adb) {
    Write-Host "[OK] Android Debug Bridge (adb) found at: $($adb.Source)" -ForegroundColor Green
} else {
    Write-Host "[INFO] adb was not found on your PATH." -ForegroundColor Yellow
    Write-Host "       To inspect Android devices, install Android Platform Tools and add adb to PATH." -ForegroundColor Yellow
}

Write-Host "`nInstallation Complete! 🎉" -ForegroundColor Green
Write-Host "AppXRay is now installed at: $targetDir" -ForegroundColor Cyan
Write-Host "`nYou can now open Antigravity and use these slash commands:" -ForegroundColor White
Write-Host "  /appxray          - Full end-to-end application intelligence teardown" -ForegroundColor Gray
Write-Host "  /appxray-discover - Enumerate 3rd-party apps & APKs on connected devices" -ForegroundColor Gray
Write-Host "  /appxray-compare  - Side-by-side competitive matrix and UX teardown" -ForegroundColor Gray
Write-Host "  /appxray-blueprint - Generate product thesis, MVP roadmap & economics" -ForegroundColor Gray

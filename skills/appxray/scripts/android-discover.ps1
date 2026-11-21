<#
.SYNOPSIS
    Discovers installed third-party Android packages and best-effort version metadata via ADB.
.DESCRIPTION
    Lists installed third-party package names, version names, and APK file paths.
    Safe and non-invasive: does not pull APKs or access private /data/data sandboxes.
#>
[CmdletBinding()]
param()

$adb = Get-Command adb -ErrorAction SilentlyContinue
if (-not $adb) {
    Write-Error "ERROR: adb not found. Please install Android Platform Tools and add adb to your PATH."
    exit 127
}

$state = & adb get-state 2>$null
if ($LASTEXITCODE -ne 0 -or [string]::IsNullOrWhiteSpace($state)) {
    Write-Error "ERROR: No authorized Android device/emulator found.`nConnect a device, enable USB debugging, accept the RSA prompt on the device, then run: adb devices -l"
    exit 2
}

Write-Host "Connected device(s):" -ForegroundColor Cyan
& adb devices -l

Write-Host "`nInstalled third-party packages (best-effort metadata):" -ForegroundColor Cyan
"{0,-55} {1,-18} {2}" -f 'PACKAGE', 'VERSION', 'APK_PATHS'
"{0,-55} {1,-18} {2}" -f ('-' * 55), ('-' * 18), ('-' * 30)

$rawPackages = & adb shell pm list packages -3 2>$null
$packages = @()
foreach ($line in $rawPackages) {
    if ($line -match '^package:(.+)$') {
        $packages += $Matches[1].Trim()
    }
}
$packages = $packages | Sort-Object

foreach ($pkg in $packages) {
    if ([string]::IsNullOrWhiteSpace($pkg)) { continue }
    $version = "unknown"
    $dumpsys = & adb shell dumpsys package $pkg 2>$null
    $versionLine = $dumpsys | Select-String -Pattern 'versionName=([^\s]+)' | Select-Object -First 1
    if ($versionLine -and $versionLine.Matches.Groups.Count -gt 1) {
        $version = $versionLine.Matches.Groups[1].Value
    }
    
    $pathsRaw = & adb shell pm path $pkg 2>$null
    $pathList = @()
    foreach ($p in $pathsRaw) {
        if ($p -match '^package:(.+)$') {
            $pathList += $Matches[1].Trim()
        }
    }
    $paths = $pathList -join ';'
    if (-not $paths) { $paths = "unavailable" }
    
    "{0,-55} {1,-18} {2}" -f $pkg, $version, $paths
}

Write-Host @"

NOTE:
- This script lists third-party package IDs, best-effort version names, and package APK paths.
- It does not pull APKs, enumerate private app data, or guarantee package labels.
- Some apps use split APKs; pm path may return multiple paths.
- Only pull APK files when you are authorized and the device permits access.
"@ -ForegroundColor Yellow

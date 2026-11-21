@echo off
REM Double-click installer for AppXRay on Windows
title AppXRay Plugin Setup for Antigravity
echo ==========================================
echo         AppXRay Plugin Installer         
echo  Application Intelligence for Antigravity
echo ==========================================
echo.

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1"

echo.
pause

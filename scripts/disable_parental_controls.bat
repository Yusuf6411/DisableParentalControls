@echo off
:: Disable Parental Controls

echo This script will attempt to disable Parental Controls.
echo You must run this script as an administrator.
pause

:: Check if the script is run as administrator
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Please run this script as an administrator.
    pause
    exit /b
)

:: Disable Windows Parental Controls service
sc stop WpcMonSvc
sc config WpcMonSvc start= disabled

:: Modify Registry to disable Family Safety features
reg delete "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Parental Controls" /f
reg delete "HKCU\Software\Microsoft\Windows\CurrentVersion\Parental Controls" /f

echo Parental Controls have been disabled.
pause

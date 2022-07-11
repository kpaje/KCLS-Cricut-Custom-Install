::Navigates to installer's current directory, temporarily bypass executionPolicy, then run Powershell script

cd /d "%~dp0
PowerShell -executionpolicy bypass -windowstyle hidden -noninteractive -nologo -file "CricutConfig.ps1"


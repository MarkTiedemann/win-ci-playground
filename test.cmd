@echo off
set current_version="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
reg query %current_version% /v CurrentVersion
reg query %current_version% /v CurrentBuild
reg query %current_version% /v InstallationType
reg query %current_version% /v EditionID
reg query %current_version% /v ProductName

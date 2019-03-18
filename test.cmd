@echo off
ver
set key="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion"
reg query %key% /v CurrentVersion | findstr CurrentVersion
reg query %key% /v CurrentBuild | findstr CurrentBuild
reg query %key% /v InstallationType | findstr InstallationType
reg query %key% /v EditionID | findstr EditionID
reg query %key% /v ProductName | findstr ProductName

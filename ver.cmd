@echo off
set key="HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion"

reg query %key% /v CurrentVersion | findstr CurrentVersion
wmic os get Version

reg query %key% /v CurrentBuild | findstr CurrentBuild
wmic os get BuildNumber

reg query %key% /v InstallationType | findstr InstallationType

reg query %key% /v EditionID | findstr EditionID

reg query %key% /v ProductName | findstr ProductName
wmic os get Caption
wmic os get Name

$ErrorActionPreference = "Stop"

$Reg = "${Env:SystemRoot}\System32\reg.exe"
$Wmic = "${Env:SystemRoot}\System32\wbem\WMIC.exe"

$Query = "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion"

& $Reg query $Query /v CurrentVersion
& $Wmic os get Version

& $Reg query $Query /v CurrentBuild
& $Wmic os get BuildNumber

& $Reg query $Query /v InstallationType

& $Reg query $Query /v EditionID

& $Reg query $Query /v ProductName
& $Wmic os get Caption
& $Wmic os get Name

$ErrorActionPreference = 'Stop'

$Reg = "${Env:SystemRoot}\System32\reg.exe"
$Wmic = "${Env:SystemRoot}\System32\wbem\WMIC.exe"

function Query-Registry ($Key) {
  $Query = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion'
  $Result = & $Reg query $Query /v $Key
  $Match = $Result -match "^\s+$Key\s+REG_SZ\s+(.+)$"
  $Value = $Match -replace "^\s+$Key\s+REG_SZ\s+(.+)$", '$1'
  Write-Host "$Key = $Value"
}

Query-Registry CurrentVersion
& $Wmic os get Version

Query-Registry CurrentBuild
& $Wmic os get BuildNumber

Query-Registry InstallationType

Query-Registry EditionID

Query-Registry ProductName
& $Wmic os get Caption
& $Wmic os get Name

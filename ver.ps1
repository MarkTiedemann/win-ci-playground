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

function Query-WMI ($Key) {
  $Query = 'os'
  $Result = & $Wmic $Query get $Key
  if ($Result -match "^$Key\s+$") {
    $Match = $Result -split "`r`n"
    $Value = $Result[2]
  } else {
    $Match = $Result -match "^$Key\s= (.+)$"
    $Value = $Match -replace "^$Key\s= (.+)$", '$1'
  }
  Write-Host "$Key = $Value"
}

Query-Registry CurrentVersion
Query-WMI Version

Query-Registry CurrentBuild
Query-WMI BuildNumber

Query-Registry InstallationType

Query-Registry EditionID

Query-Registry ProductName
Query-WMI Caption
Query-WMI Name

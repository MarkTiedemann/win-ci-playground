$ErrorActionPreference = 'Stop'

$Reg = "${Env:SystemRoot}\System32\reg.exe"
$Wmic = "${Env:SystemRoot}\System32\wbem\WMIC.exe"

function Query-Reg ($Key) {
  $Query = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion'
  $Result = & $Reg query $Query /v $Key
  $Match = $Result -match "^\s+$Key\s+REG_SZ\s+(.+)$"
  $Value = $Match -replace "^\s+$Key\s+REG_SZ\s+(.+)$", '$1'
  New-Object PSCustomObject @{
    Query = 'reg'
    Key   = $Key
    Value = $Value
  }
}

function Query-Wmi ($Key) {
  $Query = 'os'
  $Result = & $Wmic $Query get $Key
  if ($Result -match "^$Key\s+$") {
    $Match = $Result -split "`r`n"
    $Value = $Result[2]
  } else {
    $Match = $Result -match "^$Key\s= (.+)$"
    $Value = $Match -replace "^$Key\s= (.+)$", '$1'
  }
  New-Object PSCustomObject @{
    Query = 'wmi'
    Key   = $Key
    Value = $Value
  }
}

$Table = @()
$Table += Query-Reg CurrentVersion
$Table += Query-Wmi Version
$Table += Query-Reg CurrentBuild
$Table += Query-Wmi BuildNumber
$Table += Query-Reg InstallationType
$Table += Query-Reg EditionID
$Table += Query-Reg ProductName
$Table += Query-Wmi Caption
$Table += Query-Wmi Name
$Table | Format-Table

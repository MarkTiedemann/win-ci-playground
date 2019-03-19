$ErrorActionPreference = 'Stop'

$Reg = "${Env:SystemRoot}\System32\reg.exe"
$Wmic = "${Env:SystemRoot}\System32\wbem\WMIC.exe"

function Query-Reg ($Key) {
  $Query = 'HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion'
  $Result = & $Reg query $Query /v $Key
  $Match = $Result -match "^\s+$Key\s+REG_SZ\s+(.+)$"
  $Value = ($Match -replace "^\s+$Key\s+REG_SZ\s+(.+)$", '$1')[0]
  New-Object PSObject -Property @{
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
  New-Object PSObject -Property @{
    Query = 'wmi'
    Key   = $Key
    Value = $Value
  }
}

$List = @()
$List += Query-Reg CurrentVersion
$List += Query-Wmi Version
$List += Query-Reg CurrentBuild
$List += Query-Wmi BuildNumber
$List += Query-Reg InstallationType
$List += Query-Reg EditionID
$List += Query-Reg ProductName
$List += Query-Wmi Caption
$List += Query-Wmi Name
$List | Format-Table -Property Query, Key, Value

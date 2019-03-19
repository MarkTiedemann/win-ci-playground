$ErrorActionPreference = 'Stop'

function Query-Reg ([String] $Key) {
  $Reg = "${Env:SystemRoot}\System32\reg.exe"
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

function Query-Wmi ([String] $Key) {
  $Wmic = "${Env:SystemRoot}\System32\wbem\wmic.exe"
  $Query = 'os'
  $Result = & $Wmic $Query get $Key
  $Value = if ($Result -match "^$Key\s+$") {
    ($Result -split "`r`n")[2]
  } else {
    $Result -replace "^$Key\s+= (.+)$", '$1'
  }
  New-Object PSObject -Property @{
    Query = 'wmi'
    Key   = $Key
    Value = $Value
  }
}

@(
  (Query-Reg CurrentVersion),
  (Query-Wmi Version),
  (Query-Reg CurrentBuild),
  (Query-Wmi BuildNumber),
  (Query-Reg InstallationType),
  (Query-Reg EditionID),
  (Query-Reg ProductName),
  (Query-Wmi Caption),
  (Query-Wmi Name)
) | Format-Table -Property Query, Key, Value

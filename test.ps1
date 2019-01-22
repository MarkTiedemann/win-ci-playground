$ErrorActionPreference = 'Stop'
$VerbosePreference = 'Continue'
Write-Output $PSVersionTable
Set-PSDebug -Trace 2
$Job = Start-Job -ScriptBlock {
  Set-PSDebug
  (Invoke-WebRequest 'https://github.com/denoland/deno/releases').Content
}
$Job | Wait-Job -Timeout 10
$Job | Stop-Job
$Job | Receive-Job

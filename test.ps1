$ErrorActionPreference = 'Stop'
$VerbosePreference = 'Continue'
Write-Output $PSVersionTable
Set-PSDebug -Trace 2
$Job = Start-Job -ScriptBlock {
  Set-PSDebug -Trace 2
  (Invoke-WebRequest 'https://github.com/denoland/deno/releases').RawContent
}
$Job | Wait-Job -Timeout 10
$Job | Stop-Job
$Job | Receive-Job

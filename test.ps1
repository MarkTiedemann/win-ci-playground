$ErrorActionPreference = 'Stop'
$VerbosePreference = 'Continue'
Set-PSDebug -Trace 2
$Job = Start-Job -ScriptBlock {
  (Invoke-WebRequest 'https://github.com/denoland/deno/releases').Links
}
$Job | Wait-Job -Timeout 10
$Job | Stop-Job
$Job | Receive-Job

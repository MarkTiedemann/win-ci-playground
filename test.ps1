$ErrorActionPreference = 'Stop'
$VerbosePreference = 'Continue'
Write-Output $PSVersionTable
Set-PSDebug -Trace 2
$Content = (Invoke-WebRequest 'https://github.com/denoland/deno/releases').Content
Write-Output $Content

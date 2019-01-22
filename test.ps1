$ErrorActionPreference = 'Stop'
$VerbosePreference = 'Continue'
Write-Output $PSVersionTable
Set-PSDebug -Trace 2
(Invoke-WebRequest 'https://github.com/denoland/deno/releases').Content

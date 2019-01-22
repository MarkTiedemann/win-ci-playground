$ErrorActionPreference = 'Stop'
$VerbosePreference = 'Continue'
Set-PSDebug -Trace 2
Invoke-WebRequest 'https://github.com/denoland/deno/releases'
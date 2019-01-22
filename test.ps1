$ErrorActionPreference = 'Stop'
$VerbosePreference = 'Continue'
Write-Output $PSVersionTable
$Response = Invoke-WebRequest 'https://github.com/denoland/deno/releases'
$HTMLFile = New-Object -Com 'HTMLFile'
$HTMLFile.write($Response.Content)
$HTMLFile.all.tags('a') | ForEach-Object { $_.href }

$ErrorActionPreference = 'Stop'
$VerbosePreference = 'Continue'
Write-Output $PSVersionTable
Set-PSDebug -Trace 2
$Response = Invoke-WebRequest 'https://github.com/denoland/deno/releases'
$HTMLFile = New-Object -Com 'HTMLFile'
$HTMLFile.IHTMLDocument2_write($Response.Content)
$OS = 'win'
$Zip = 'zip'
$HTMLFile.all.tags('a') |
  Where-Object { $_.href -like "/denoland/deno/releases/download/*/deno_${OS}_x64.$Zip" } |
  ForEach-Object { $_.href }
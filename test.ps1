$ErrorActionPreference = 'Stop'
$VerbosePreference = 'Continue'
Write-Output $PSVersionTable
$Response = Invoke-WebRequest 'https://github.com/denoland/deno/releases'
$HTMLFile = New-Object -Com 'HTMLFile'
$HTMLFile.IHTMLDocument2_write($Response.Content)
$HTMLFile.anchors

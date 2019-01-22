$ErrorActionPreference = 'Stop'
$VerbosePreference = 'Continue'
Write-Output $PSVersionTable
Set-PSDebug -Trace 2
$Content = (Invoke-WebRequest 'https://github.com/denoland/deno/releases').Content
Write-Output $Content
$HTMLFile = New-Object -Com 'HTMLFile'
$HTMLFile.IHTMLDocument2_write($Content)
$HTMLFile.all.tags('a')

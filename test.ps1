$ErrorActionPreference = 'Stop'
Write-Output $PSVersionTable
$Response = Invoke-WebRequest https://github.com/denoland/deno/releases
$HTMLFile = New-Object -Com HTMLFile
$HTMLFile.IHTMLDocument2_write($Response.Content)
$OS = 'win'
$Zip = 'zip'
$HTMLFile.getElementsByTagName('a') |
  ForEach-Object { $_.href -like "about:/denoland/deno/releases/download/*/deno_${OS}_x64.$Zip" }

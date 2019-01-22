$ErrorActionPreference = 'Stop'
Write-Output $PSVersionTable
$Response = Invoke-WebRequest https://github.com/denoland/deno/releases
$HTMLFile = New-Object -Com HTMLFile
$HTMLFile.IHTMLDocument2_write($Response.Content)
$OS = 'win'
$Zip = 'zip'
$HTMLFile.getElementsByTagName('a') |
  Where-Object { $_.href -like "about:/denoland/deno/releases/download/*/deno_${OS}_x64.$Zip" } |
  ForEach-Object { $_.href -replace 'about:', 'https://github.com' } |
  Select-Object -First 2

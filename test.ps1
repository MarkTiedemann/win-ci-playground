$ErrorActionPreference = 'Stop'
Write-Output $PSVersionTable
$Response = Invoke-WebRequest https://github.com/denoland/deno/releases
$HTMLFile = New-Object -Com HTMLFile
$HTMLFile.write(@($Response.Content))
$HTMLFile.getElementsByTagName('a') | ForEach-Object href

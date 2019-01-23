$ErrorActionPreference = 'Stop'
Set-PSDebug -Trace 2
iex (iwr https://deno.land/x/install/install.ps1)
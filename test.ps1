$ErrorActionPreference = 'Stop'
iex (iwr https://raw.githubusercontent.com/MarkTiedemann/win-ci-playground/master/install.ps1)
deno --version
iwr https://raw.githubusercontent.com/MarkTiedemann/win-ci-playground/master/install.ps1 -out install.ps1; .\install.ps1 v0.2.0
deno --version

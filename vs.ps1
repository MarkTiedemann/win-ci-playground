$ErrorActionPreference = 'Stop'
Install-Module VSSetup -Scope CurrentUser -Force
foreach ($instance in Get-VSSetupInstance -All -Prerelease) {
  @($instance) | Format-List
  $instance.packages | Format-Table
}

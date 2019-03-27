Install-Module VSSetup -Scope CurrentUser
foreach ($instance in Get-VSSetupInstance -All -Prerelease) {
  @($instance) | Format-List
  $instance.packages | Format-Table
}

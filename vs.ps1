$ErrorActionPreference = 'Stop'

# Install-Module VSSetup -Scope CurrentUser -Force
# foreach ($instance in Get-VSSetupInstance -All -Prerelease) {
#   @($instance) | Format-List
#   $instance.packages | Format-Table
# }

Get-Property HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion
(Get-CimInstance -Class Win32_OperatingSystem).Caption

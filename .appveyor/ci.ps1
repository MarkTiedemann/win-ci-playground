$ErrorActionPreference = "Stop";
Write-Host $([IntPtr]::Size);
Get-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion";

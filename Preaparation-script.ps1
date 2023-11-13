# Enable ICMP (Ping)
New-NetFirewallRule -DisplayName "Allow ICMPv4" -Protocol ICMPv4 -IcmpType 8 -Enabled True
New-NetFirewallRule -DisplayName "Allow ICMPv6" -Protocol ICMPv6 -IcmpType 128 -Enabled True

# Enable Remote Desktop (RDP)
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server'-name "fDenyTSConnections" -Value 0
Enable-NetFirewallRule -DisplayGroup "Remote Desktop"

# Disable SMBv1
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters' -Name SMB1 -Value 0
Disable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol

# Enable SMBv3
Set-SmbServerConfiguration -EnableSMB2Protocol $true
Set-SmbServerConfiguration -EnableSMB1Protocol $false

# Download and Install Thunderbird
$thunderbirdUrl = "https://download.mozilla.org/?product=thunderbird-latest&os=win&lang=en-US"
$thunderbirdInstaller = "$env:TEMP\ThunderbirdSetup.exe"
Invoke-WebRequest -Uri $thunderbirdUrl -OutFile $thunderbirdInstaller
Start-Process -Wait -FilePath $thunderbirdInstaller

Write-Host "Preparation completed successfully!"

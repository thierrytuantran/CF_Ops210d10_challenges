# Enable File and Printer Sharing
Enable-NetFirewallRule -Name FPS-*

# Allow ICMP traffic
New-NetFirewallRule -Name Allow_ICMPv4-In -Enabled True -Action Allow -Protocol ICMPv4

#Enable Remote management
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "*"
Enable-PSRemoting -Force

# Remove bloatware
Get-AppxPackage -Name Microsoft.XboxApp | Remove-AppxPackage

# Enable Hyper-V
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-All

# Disable SMBv1, an insecure protocol
Set-SmbServerConfiguration -EnableSMB1Protocol $false

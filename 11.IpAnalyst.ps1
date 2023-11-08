# Specify the file path
$filePath = "C:\Users\admin\Documents\get_Ip.txt"

# Create get_Ip.txt file by running ipconfig /all and saving the output
ipconfig /all > $filePath

# Search for IPv4 address in get_Ip.txt using Select-String
$ipv4Address = Get-Content $filePath | Select-String -Pattern 'IPv4 Address' | ForEach-Object { $_ -replace '\D+(\d+\.\d+\.\d+\.\d+).*', '$1' }

# Display the IPv4 address
Write-Host "IPv4 Address: $ipv4Address"

# Remove the temporary file
Remove-Item -Path $filePath -Force

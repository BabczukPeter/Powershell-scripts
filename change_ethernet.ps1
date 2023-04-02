# Get all network adapters
$adapters = Get-NetAdapter | Where-Object { $_.Status -eq 'Up' }

foreach ($adapter in $adapters) {
    Write-Host "Configuring $($adapter.Name)"

    # Prompt for IP address
    $ip = Read-Host "Enter IP address for $($adapter.Name) (leave blank to skip)"

    # Prompt the user for a new subnet mask
    $subMask = Read-Host "Enter the new subnet mask in the xxx.xxx.xxx.xxx format (e.g. 255.255.255.0)"

    # Validate the subnet mask format
    $validSubMask = $subMask -match "^(\d{1,3}\.){3}\d{1,3}$"

    if (!$validSubMask) {
        Write-Host "Invalid subnet mask format. Please enter a valid subnet mask in the xxx.xxx.xxx.xxx format."
        exit 1
    }

    # Convert the subnet mask to a prefix length format
    $prefixLength = 0
    $subMask.Split(".") | ForEach-Object {
        $prefixLength += [System.Convert]::ToString([System.Convert]::ToByte($_), 2).Replace("0","").Length
    }

    # Prompt for default gateway
    $gateway = Read-Host "Enter default gateway for $($adapter.Name) (leave blank to skip)"

    # Prompt for DNS server addresses
    $dns = Read-Host "Enter DNS server addresses for $($adapter.Name) (separate multiple addresses with commas, leave blank to skip)"

    # Apply the changes
    if (![string]::IsNullOrEmpty($ip)) {
        New-NetIPAddress -InterfaceIndex $adapter.ifIndex -IPAddress $ip -PrefixLength $prefixLength -DefaultGateway $gateway -ErrorAction SilentlyContinue | Out-Null
    }

    if (![string]::IsNullOrEmpty($dns)) {
        $dnsAddresses = $dns.Split(',') | ForEach-Object { $_.Trim() }
        Set-DnsClientServerAddress -InterfaceIndex $adapter.ifIndex -ServerAddresses $dnsAddresses -ErrorAction SilentlyContinue | Out-Null
    }
}

# Display the updated network configuration
ipconfig /all

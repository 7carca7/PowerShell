clear
Write-Output "Wi-Fi Profiles saved in Windows"

# Get the names of all saved Wi-Fi profiles
$profiles = netsh wlan show profiles | Select-String "(Perfil | Profile)" | ForEach-Object {
    $_.Line.Split(":")[1].Trim()
}

# Iterate over each profile and get the security key
foreach ($profile in $profiles) {
    Write-Output "`nProfile: $profile"
    
    # Get profile information including security key
    $keyContent = netsh wlan show profile name="$profile" key=clear
    
    # Extract the line containing the security key
    $keyLine = $keyContent | Select-String "(Contenido de la clave | Key content)"
    
    if ($keyLine) {
        # Extract and display the key
        $key = $keyLine.Line.Split(":")[1].Trim()
        Write-Output "Key: $key"
    } else {
        Write-Output "Key: Could not be retrieved or the network does not have a key"
    }
}

Read-Host "`nPress Enter to exit..."
clear

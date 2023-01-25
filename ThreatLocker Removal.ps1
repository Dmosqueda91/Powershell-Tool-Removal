# This script will download installer and run the unistall that is within the file. 


# Check if the operating system is 64-bit or 32-bit
if ([Environment]::Is64BitOperatingSystem) {
    # If 64-bit, set the download URL for the 64-bit installer
    $downloadURL = "https://api.threatlocker.com/installers/threatlockerstubx64.exe";
}
else {
    # If 32-bit, set the download URL for the 32-bit installer
    $downloadURL = "https://api.threatlocker.com/installers/threatlockerstubx86.exe";
}

# Set the local installer file path
$localInstaller = "C:\Temp\ThreatLockerStub.exe";

# Download the installer from the specified URL
Invoke-WebRequest -Uri $downloadURL -OutFile $localInstaller;

# Run the installer with the "uninstall" parameter
& $localInstaller uninstall;

# Cleanup
Remove-Item -Path "C:\Temp\ThreatLockerStub.exe" -Force

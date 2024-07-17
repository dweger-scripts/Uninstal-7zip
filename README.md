# Uninstall-7zip
This script will check the specified software version.
If the installed version is a vulnerable one, this script will attempt an uninstall. 
If the installed version is not vulnerable, it will tell you.

## Usage
Download this script then run.

`.\Uninstall-7zip.ps1 `

## RMM Deployment
Powershell one-liner for easy use in an RMM.

` $downloadURI = 'https://raw.githubusercontent.com/dweger-scripts/Uninstall-7zip/main/Uninstall-7zip.ps1'; $script = 'C:\temp\Uninstall-7zip.ps1'; Invoke-WebRequest -URI $downloadURI -Outfile $script `

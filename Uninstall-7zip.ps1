#*********************************************************************
#========================
# Uninstall-7zip.ps1
#========================
# This script will check the specified software version.
# If the installed version is a vulnerable one, this script will attempt an uninstall.
# If the installed version is not vulnerable, it will tell you.
#========================
# Modified: 03.04.2024
#========================
$AppName = "7zip"
$AppWildcard = "*$AppName*"
$AppLatestVulnerableVersion = [System.Version]"23.9.7"

# Grab software version
$App = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -like $AppWildcard}

# If SC agent is not installed/if the variable is null.
if(!$App.DisplayVersion){Write-Host "2 - No "$AppName "Installed";exit}

# If SC agent is greater than or equal to the patched version.
if([System.Version]$App.DisplayVersion -ge $AppLatestVulnerableVersion){Write-Host "1 - Not Vulnerable -"$App.DisplayVersion;exit}


# If SC agent is less than the patched version.
if([System.Version]$App.DisplayVersion -lt $AppLatestVulnerableVersion){
    Write-Host "0 - Vulnerable -"$App.DisplayVersion
    get-ciminstance -classname Win32_Product -filter "Name like '$AppName%'"|Invoke-CimMethod -MethodName UnInstall|Out-null
    $AppNew = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Where { $_.DisplayName -like $AppWildcard}
        if(!$AppNew){Write-Host "3 - Uninstalled " $AppName "-" $App.DisplayVersion;exit}
        }





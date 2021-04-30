# Include functions
. .\functions.ps1

Write-STIGRule "The virtual switch MAC Address Change policy must be set to reject on the ESXi host."

$allVirtualSwitches = Get-VirtualSwitch

foreach ($virtualSwitch in $allVirtualSwitches) {
    Get-VirtualSwitch | 
     Get-SecurityPolicy |
     Set-SecurityPolicy -MacChanges $false
        
    Get-VirtualPortGroup |
     Get-SecurityPolicy |
     Set-SecurityPolicy -MacChangesInherited $true

    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
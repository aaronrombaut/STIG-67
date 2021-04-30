# Include functions
. .\functions.ps1

Write-STIGRule "The virtual switch Promiscuous Mode policy must be set to reject on the ESXi host."

$allVirtualSwitches = Get-VirtualSwitch

foreach ($virtualSwitch in $allVirtualSwitches) {
    Get-VirtualSwitch | 
     Get-SecurityPolicy |
     Set-SecurityPolicy -AllowPromiscuous $false
        
    Get-VirtualPortGroup |
     Get-SecurityPolicy |
     Set-SecurityPolicy -AllowPromiscuousInherited $true

    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
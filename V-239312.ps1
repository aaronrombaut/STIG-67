# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must enable BPDU filter on the host to prevent being locked out of physical switch ports with Portfast and BPDU Guard enabled."

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name Net.BlockGuestBPDU |
     Set-AdvancedSetting -Value 1 -Confirm:$false |
     Format-Table -AutoSize
     
    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
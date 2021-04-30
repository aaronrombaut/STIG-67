# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must disable Inter-VM transparent page sharing."

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name Mem.ShareForceSalting |
     Set-AdvancedSetting -Value 2 -Confirm:$false |
     Format-Table -AutoSize

    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
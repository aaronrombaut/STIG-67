# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must verify the DCUI.Access list."

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost | 
     Get-AdvancedSetting -Name DCUI.Access | 
     Set-AdvancedSetting -Value "root" -Confirm:$false |
     Format-Table -AutoSize
}

if($doPause) {
    Pause
}
Write-Separator
# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must disable the Managed Object Browser (MOB)."

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name Config.HostAgent.plugins.solo.enableMob |
     Set-AdvancedSetting -Value false -Confirm:$false |
     Format-Table -AutoSize
     
    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must produce audit records containing information to establish what type of events occurred."

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name Config.HostAgent.log.level |
     Set-AdvancedSetting -Value "info" -Confirm:$false |
     Format-Table -AutoSize
     
    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
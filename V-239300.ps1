# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must enable a persistent log location for all locally stored logs."

$allVMhosts = Get-VMHost
$newLogLocation = "[Synology-LUN1]/logs" # Reset to default on null; [datastoreName]/logdir

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name Syslog.global.logDir |
     Set-AdvancedSetting -Value $newLogLocation -Confirm:$false |
     Format-Table -AutoSize

    # Place logs in a unique subdirectory of logdir, based on hostname.
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name Syslog.global.logDirUnique |
     Set-AdvancedSetting -Value $true -Confirm:$false |
     Format-Table -AutoSize

    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
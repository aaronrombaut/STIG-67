# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must terminate shell services after 10 minutes."

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name UserVars.ESXiShellTimeOut |
     Set-AdvancedSetting -Value 600 -Confirm:$false |
     Format-Table -AutoSize
     
    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must enforce the limit of three consecutive invalid logon attempts by a user."

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name Security.AccountLockFailures |
     Set-AdvancedSetting -Value 3 -Confirm:$false |
     Format-Table -AutoSize

    if ($showComments) {
        Get-VMHost -Name $vmhost | Get-AdvancedSetting -Name Security.AccountLockFailures | Format-Table -AutoSize
    }
}

if($doPause) {
    Pause
}
Write-Separator
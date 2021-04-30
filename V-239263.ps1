# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must enforce the unlock timeout of 15 minutes after a user account is locked out."

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name Security.AccountUnlockTime | 
     Set-AdvancedSetting -Value 900 -Confirm:$false | 
     Format-Table -AutoSize

    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must prohibit the reuse of passwords within five iterations."

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name Security.PasswordHistory |
     Set-AdvancedSetting -Value 5 -Confirm:$false |
     Format-Table -AutoSize
     
    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
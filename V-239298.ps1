# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must log out of the console UI after two minutes."

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name UserVars.DcuiTimeOut |
     Set-AdvancedSetting -Value 120 -Confirm:$false |
     Format-Table -AutoSize
     
    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
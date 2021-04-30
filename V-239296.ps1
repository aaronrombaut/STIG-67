# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must set a timeout to automatically disable idle shell sessions after two minutes."

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name UserVars.ESXiShellInteractiveTimeOut |
     Set-AdvancedSetting -Value 120 -Confirm:$false |
     Format-Table -AutoSize
     
    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
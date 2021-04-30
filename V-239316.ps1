# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must prevent unintended use of the dvFilter network APIs."

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name Net.DVFilterBindIpAddress |
     Set-AdvancedSetting -Value "" -Confirm:$false |
     Format-Table -AutoSize
     
    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
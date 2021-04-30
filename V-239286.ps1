# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must enforce password complexity by requiring that at least one uppercase character be used."

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name Security.PasswordQualityControl |
     Set-AdvancedSetting -Value "similar=deny retry=3 min=disabled,disabled,disabled,disabled,15" -Confirm:$false |
     Format-Table -AutoSize
     
    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
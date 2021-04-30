# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must not suppress warnings that the local or remote shell sessions are enabled."

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name UserVars.SuppressShellWarning |
     Set-AdvancedSetting -Value "0" -Confirm:$false |
     Format-Table -AutoSize

    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
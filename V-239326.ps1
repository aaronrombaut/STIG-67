# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must exclusively enable TLS 1.2 for all endpoints."

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name UserVars.ESXiVPsDisabledProtocols |
     Set-AdvancedSetting -Value "tlsv1,tlsv1.1,sslv3" -Confirm:$false |
     Format-Table -AutoSize
    
    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must configure the firewall to block network traffic by default."

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-VMHostFirewallDefaultPolicy |
     Set-VMHostFirewallDefaultPolicy -AllowIncoming $false -AllowOutgoing $false -Confirm:$false |
     Format-Table -AutoSize

    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
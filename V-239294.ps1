# Include functions
. .\functions.ps1

Write-STIGRule "Active Directory ESX Admin group membership must not be used when adding ESXi hosts to Active Directory."

$allVMhosts = Get-VMHost
$domainSecurityGroup = "Virtualization-Admins"

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name Config.HostAgent.plugins.hostsvc.esxAdminsGroup |
     Set-AdvancedSetting -Value $domainSecurityGroup -Confirm:$false |
     Format-Table -AutoSize
     
    if ($showComments) {
        
    }
}


if($doPause) {
    Pause
}
Write-Separator
# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must be configured to disable nonessential capabilities by disabling SSH."

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Write-Host "Set policy off."
    Get-VMHost -Name $vmhost |
     Get-VMHostService | 
     Where-Object {$_.Label -eq "SSH"} | 
     Set-VMHostService -Policy Off -Confirm:$false |
     Format-Table -AutoSize

    Write-Host "Stop the service."
    Get-VMHost -Name $vmhost |
     Get-VMHostService |
     Where-Object {$_.Label -eq "SSH"} | 
     Stop-VMHostService -Confirm:$false |
     Format-Table -AutoSize
     
    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
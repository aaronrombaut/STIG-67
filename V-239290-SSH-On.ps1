# Include functions
. .\functions.ps1

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    Write-Host "Set policy on."
    Get-VMHost -Name $vmhost |
     Get-VMHostService | 
     Where-Object {$_.Label -eq "SSH"} | 
     Set-VMHostService -Policy On -Confirm:$false |
     Format-Table -AutoSize

    Write-Host "Start the service."
    Get-VMHost -Name $vmhost |
     Get-VMHostService |
     Where-Object {$_.Label -eq "SSH"} | 
     Start-VMHostService -Confirm:$false |
     Format-Table -AutoSize
     
    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
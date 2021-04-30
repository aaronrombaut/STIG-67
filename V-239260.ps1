# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must verify the exception users list for Lockdown Mode."

Write-host -ForegroundColor Red "This is a manual check!"

$allVMhosts = Get-VMHost | Get-View

Write-Host -ForegroundColor Yellow "Review Lockdown Mode Exception Users"
foreach ($vmhost in $allVMhosts) {
    $lockdown = Get-View $vmhost.ConfigManager.HostAccessManager
    Write-Host ">>" $lockdown.QueryLockdownExceptions()
}

if($doPause) {
    Pause
}
Write-Separator
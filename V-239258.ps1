# Include functions
. .\functions.ps1

Write-STIGRule "Access to the ESXi host must be limited by enabling Lockdown Mode."

$toLockdownLevel = "lockdownDisabled" # lockdownDisabled; lockdownNormal; lockdownStrict

Write-Host -ForegroundColor Yellow -NoNewline "Set Lockdown Mode to: "
if($toLockdownLevel -like "lockdownDisabled") {
    Write-Host "Disabled"
} elseif ($toLockdownLevel -like "lockdownNormal") {
    Write-Host "Normal"
} elseif ($toLockdownLevel -like "lockdownStrict") {
    Write-Host "Strict"
}

$allVMhosts = Get-VMHost | Get-View

foreach ($vmhost in $allVMhosts) {
    $lockdown = Get-View $vmhost.ConfigManager.HostAccessManager
    $lockdown.ChangeLockdownMode($toLockdownLevel)

    if ($showComments) {
        Get-VMHost | Select-Object Name,@{N="Lockdown";E={$_.Extensiondata.Config.LockdownMode}}
    }
}

if($doPause) {
    Pause
}
Write-Separator
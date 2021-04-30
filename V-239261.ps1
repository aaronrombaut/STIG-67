# Include functions
. .\functions.ps1

Write-STIGRule "Remote logging for ESXi hosts must be configured."

$syslogHost = "" # Null sets default; udp://0.0.0.0:514

$allVMhosts = Get-VMHost

foreach($vmhost in $allVMhosts) { 
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name Syslog.global.logHost |
     Set-AdvancedSetting -Value $syslogHost -Confirm:$false |
     Format-Table -AutoSize
}

if($doPause) {
    Pause
}
Write-Separator
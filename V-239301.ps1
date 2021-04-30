# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must configure NTP time synchronization."

$allVMhosts = Get-VMHost
$NTPServers = "pool.ntp.org"  # "ntpserver1","ntpserver2"

foreach ($vmhost in $allVMhosts) {
    if((Get-VMHost -Name $vmhost | Get-VMHostNtpServer) -like $NTPServers) {
        Write-Host -ForegroundColor Yellow "NTP Servers exist on $vmhost...skipping"
    } else {
        Get-VMHost -Name $vmhost |
        Add-VMHostNTPServer $NTPServers
    }
    # Set the NTP Service poilcy On
    Get-VMHost -Name $vmhost |
     Get-VMHostService |
     Where-Object {$_.Label -eq "NTP Daemon"} |
     Set-VMHostService -Policy On

    # Start the NTP Service
    Get-VMHost -Name $vmhost |
     Get-VMHostService |
     Where-Object {$_.Label -eq "NTP Daemon"} |
     Start-VMHostService
    
    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
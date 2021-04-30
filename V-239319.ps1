# Include functions
. .\functions.ps1

Write-STIGRule " For the ESXi host, all port groups must not be configured to VLAN values reserved by upstream physical switches."

$allVirtualPortGroups = Get-VirtualPortGroup | Select-Object Name, VLanId
$catalystReservedLowVLAN = "1001"
$catalystReservedHighVLAN = "1024"
$nexusReservedLowVLAN = "3968"
$nexusReservedHighVLAN = "4047"
$ReservedVLAN = "4094"

Write-Host -NoNewline -ForegroundColor Yellow "Configured Cisco Catalyst reserved VLANs: "
Write-Host $catalystReservedLowVLAN" - "$catalystReservedHighVLAN

Write-Host -NoNewline -ForegroundColor Yellow "Configured Cisco Nexus reserved VLANs: "
Write-Host $nexusReservedLowVLAN" - "$nexusReservedHighVLAN


foreach ($virtualPortGroup in $allVirtualPortGroups) {
    if($($virtualPortGroup).VLanId -ge $catalystReservedLowVLAN -and $($virtualPortGroup).VLanId -le $catalystReservedHighVLAN) {
        Write-Host -ForegroundColor Red -NoNewline "(Open) "
        Write-Host $($virtualPortGroup).Name "configured on Cisco Catalyst reserved VLAN ("$($virtualPortGroup).VLanId")."
    } elseif ($($virtualPortGroup).VLanId -ge $nexusReservedLowVLAN -and $($virtualPortGroup).VLanId -le $nexusReservedHighVLAN) {
        Write-Host -ForegroundColor Red -NoNewline "(Open) "
        Write-Host $($virtualPortGroup).Name "configured on Cisco Nexus reserved VLAN ("$($virtualPortGroup).VLanId")."
    } elseif ($($virtualPortGroup).VLanId -eq $ReservedVLAN ) {
        Write-Host -ForegroundColor Red -NoNewline "(Open) "
        Write-Host $($virtualPortGroup).Name "configured on reserved VLAN ("$($virtualPortGroup).VLanId")."
    } 
    else {
        Write-Host -ForegroundColor Green -NoNewline "(Not a Finding) "
        Write-Host $($virtualPortGroup).Name "not configured on a reserved VLAN ("$($virtualPortGroup).VLanId")."
    }
    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
# Include functions
. .\functions.ps1

Write-STIGRule "For the ESXi host, all port groups must not be configured to VLAN 4095 unless Virtual Guest Tagging (VGT) is required."

$allVirtualPortGroups = Get-VirtualPortGroup | Select-Object Name, VLanId
$virtualGuestTaggingVLAN = "4095"

foreach ($virtualPortGroup in $allVirtualPortGroups) {
    if($($virtualPortGroup).VLanId -like $virtualGuestTaggingVLAN) {
        Write-Host -ForegroundColor Red -NoNewline "(Open) "
        Write-Host $($virtualPortGroup).Name "configured for Virtual Guest Tagging ($virtualGuestTaggingVLAN)."
    } else {
        Write-Host -ForegroundColor Green -NoNewline "(Not a Finding) "
        Write-Host $($virtualPortGroup).Name "not configured for Virtual Guest Tagging ($virtualGuestTaggingVLAN)."
    }
    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
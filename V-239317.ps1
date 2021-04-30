# Include functions
. .\functions.ps1

Write-STIGRule "For the ESXi host, all port groups must be configured to a value other than that of the native VLAN."

$allVirtualPortGroups = Get-VirtualPortGroup | Select-Object Name, VLanId
$nativeVLAN = "92"

foreach ($virtualPortGroup in $allVirtualPortGroups) {
    if($($virtualPortGroup).VLanId -like $nativeVLAN) {
        Write-Host -ForegroundColor Red -NoNewline "(Open) "
        Write-Host $($virtualPortGroup).Name "configured on the native VLAN ($nativeVLAN)."
    } else {
        Write-Host -ForegroundColor Green -NoNewline "(Not a Finding) "
        Write-Host $($virtualPortGroup).Name "not configured on the native VLAN ($nativeVLAN)."
    }
    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
# Include functions
. .\functions.ps1

Write-STIGRule ""

<#
$allVMhosts = Get-VMHost
$allVMhosts = Get-VMHost | Get-View

foreach ($vmhost in $allVMhosts) {
    
    if ($showComments) {
        
    }
}
#>

if($doPause) {
    Pause
}
Write-Separator
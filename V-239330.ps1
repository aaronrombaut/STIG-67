# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must centrally review and analyze audit records from multiple components within the system by configuring remote logging."

Write-Host -ForegroundColor Yellow -NoNewline "Duplicate "
Write-Host "of STIG-ID: ESXI-67-000004"

if($doPause) {
    Pause
}
Write-Separator
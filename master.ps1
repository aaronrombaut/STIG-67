# Include functions
. .\functions.ps1

Clear-Host

$showComments = $false
$doPause = $true

Write-Host -ForegroundColor Green -NoNewline "Comments: "
if($showComments) { 
    Write-Host "On"
} else {
    Write-Host "Off"
}

Write-Host -ForegroundColor Green -NoNewline "Pause: "
if($doPause) { 
    Write-Host "On"
} else {
    Write-Host "Off"
}
Write-Separator

. .\V-239258.ps1 # Rule Title: Access to the ESXi host must be limited by enabling Lockdown Mode.
. .\V-239259.ps1 # Rule Title: The ESXi host must verify the DCUI.Access list.
. .\V-239260.ps1 # Rule Title: The ESXi host must verify the exception users list for Lockdown Mode.
. .\V-239261.ps1 # Rule Title: Remote logging for ESXi hosts must be configured.
. .\V-239262.ps1 # Rule Title: The ESXi host must enforce the limit of three consecutive invalid logon attempts by a user.
#. .\V-239262.ps1 # Rule Title:
#. .\V-239262.ps1 # Rule Title:
#. .\V-239262.ps1 # Rule Title:
#. .\V-239262.ps1 # Rule Title:
#. .\V-239262.ps1 # Rule Title:
#. .\V-239262.ps1 # Rule Title:
#. .\V-239262.ps1 # Rule Title:
#. .\V-239262.ps1 # Rule Title:
#. .\V-239262.ps1 # Rule Title:
#. .\V-239262.ps1 # Rule Title:
#. .\V-239262.ps1 # Rule Title:
#. .\V-239262.ps1 # Rule Title:
#. .\V-239262.ps1 # Rule Title:

Write-Host "End..."
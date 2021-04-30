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
. .\V-239263.ps1 # Rule Title: The ESXi host must enforce the unlock timeout of 15 minutes after a user account is locked out.
. .\V-239264.ps1 # Rule Title: The ESXi host must display the Standard Mandatory DoD Notice and Consent Banner before granting access to the system via the DCUI.
. .\V-239265.ps1 # Rule Title: The ESXi host must display the Standard Mandatory DoD Notice and Consent Banner before granting access to the system via SSH.
. .\V-239285.ps1 # Rule Title: The ESXi host must produce audit records containing information to establish what type of events occurred.
. .\V-239286.ps1 # Rule Title: The ESXi host must enforce password complexity by requiring that at least one uppercase character be used.
. .\V-239287.ps1 # Rule Title: The ESXi host must prohibit the reuse of passwords within five iterations.
. .\V-239289.ps1 # Rule Title: The ESXi host must disable the Managed Object Browser (MOB).
. .\V-239290.ps1 # Rule Title: The ESXi host must be configured to disable nonessential capabilities by disabling SSH.
. .\V-239291.ps1 # Rule Title: The ESXi host must disable ESXi Shell unless needed for diagnostics or troubleshooting.
. .\V-239292.ps1 # Rule Title: The ESXi host must use Active Directory for local user authentication.
#. .\V-239293.ps1 # Rule Title: ESXi hosts using Host Profiles and/or Auto Deploy must use the vSphere Authentication Proxy to protect passwords when adding themselves to Active Directory.
. .\V-239294.ps1 # Rule Title: Active Directory ESX Admin group membership must not be used when adding ESXi hosts to Active Directory.
. .\V-239296.ps1 # Rule Title: The ESXi host must set a timeout to automatically disable idle shell sessions after two minutes.
. .\V-239297.ps1 # Rule Title: The ESXi host must terminate shell services after 10 minutes.
. .\V-239298.ps1 # Rule Title: The ESXi host must log out of the console UI after two minutes.
#. .\V-239299.ps1 # Rule Title: The ESXi host must enable kernel core dumps.
. .\V-239300.ps1 # Rule Title: The ESXi host must enable a persistent log location for all locally stored logs.
. .\V-239301.ps1 # Rule Title: The ESXi host must configure NTP time synchronization.
#. .\V-239302.ps1 # Rule Title: The ESXi Image Profile and vSphere Installation Bundle (VIB) Acceptance Levels must be verified.
#. .\V-239307.ps1 # Rule Title: SNMP must be configured properly on the ESXi host.
#. .\V-239308.ps1 # Rule Title: The ESXi host must enable bidirectional CHAP authentication for iSCSI traffic.
. .\V-239309.ps1 # Rule Title: The ESXi host must disable Inter-VM transparent page sharing.
#. .\V-239310.ps1 # Rule Title: The ESXi host must configure the firewall to restrict access to services running on the host.
. .\V-239311.ps1 # Rule Title: The ESXi host must configure the firewall to block network traffic by default.
. .\V-239312.ps1 # Rule Title: The ESXi host must enable BPDU filter on the host to prevent being locked out of physical switch ports with Portfast and BPDU Guard enabled.
. .\V-239313.ps1 # Rule Title: The virtual switch Forged Transmits policy must be set to reject on the ESXi host.
. .\V-239314.ps1 # Rule Title: The virtual switch MAC Address Change policy must be set to reject on the ESXi host.
. .\V-239315.ps1 # Rule Title: The virtual switch Promiscuous Mode policy must be set to reject on the ESXi host.
. .\V-239316.ps1 # Rule Title: The ESXi host must prevent unintended use of the dvFilter network APIs.
. .\V-239317.ps1 # Rule Title: For the ESXi host, all port groups must be configured to a value other than that of the native VLAN.
. .\V-239318.ps1 # Rule Title: For the ESXi host, all port groups must not be configured to VLAN 4095 unless Virtual Guest Tagging (VGT) is required.
. .\V-239319.ps1 # Rule Title: For the ESXi host, all port groups must not be configured to VLAN values reserved by upstream physical switches.
. .\V-239326.ps1 # Rule Title: The ESXi host must exclusively enable TLS 1.2 for all endpoints.
. .\V-239329.ps1 # Rule Title: The ESXi host must not suppress warnings that the local or remote shell sessions are enabled.
. .\V-239330.ps1 # Rule Title: The ESXi host must centrally review and analyze audit records from multiple components within the system by configuring remote logging.

Write-Host "End..."
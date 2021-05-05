# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must configure the firewall to restrict access to services running on the host."

# $esxcli = Get-EsxCli -VMhost <fully.qualified.domain.name> -V2
# $esxcli.network.firewall.ruleset.list.Invoke() | Sort-Object -Property Name
# Get-VMHost | Get-VMHostFirewallException | Select Name,Enabled,@{N="AllIPEnabled";E={$_.ExtensionData.AllowedHosts.AllIP}}
$firewallRulesets = 
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "activeDirectoryAll"; "RulesetName" = "Active Directory All"},    
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "CIMHttpServer"; "RulesetName" = "CIM Server"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "CIMHttpsServer"; "RulesetName" = "CIM Secure Server"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "CIMSLP"; "RulesetName" = "CIM SLP"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "cmmds"; "RulesetName" = "vSAN Clustering Service"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.92.0/24"; "RulesetID" = "dhcp"; "RulesetName" = "DHCP Client"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.92.0/24"; "RulesetID" = "DHCPv6"; "RulesetName" = "DHCPv6"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.92.0/24"; "RulesetID" = "dns"; "RulesetName" = "DNS Client"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "DVFilter"; "RulesetName" = "DVFilter"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "DVSSync"; "RulesetName" = "DVSSync"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "esxupdate"; "RulesetName" = "esxupdate"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "faultTolerance"; "RulesetName" = "Fault Tolerance"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "fdm"; "RulesetName" = "vSphere High Availability Agent"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "ftpClient"; "RulesetName" = "FTP Client"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "gdbserver"; "RulesetName" = "gdbserver"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "HBR"; "RulesetName" = "HBR"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "httpClient"; "RulesetName" = "httpClient"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "iofiltervp"; "RulesetName" = "iofiltervp"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "ipfam"; "RulesetName" = "NSX Distributed Logical Router Service"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "iSCSI"; "RulesetName" = "Software iSCSI Client"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "NFC"; "RulesetName" = "NFC"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "nfs41Client"; "RulesetName" = "nfs41Client"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "nfsClient"; "RulesetName" = "NFS Client"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "ntpClient"; "RulesetName" = "NTP Client"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "pvrdma"; "RulesetName" = "pvrdma"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "rabbitmqproxy"; "RulesetName" = "rabbitmqproxy"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "rdt"; "RulesetName" = "vSAN Transport"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "remoteSerialPort"; "RulesetName" = "VM serial port connected over network"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "snmp"; "RulesetName" = "SNMP Server"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "sshClient"; "RulesetName" = "SSH Client"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "sshServer"; "RulesetName" = "SSH Server"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "syslog"; "RulesetName" = "syslog"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "updateManager"; "RulesetName" = "vCenter Update Manager"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "vic-engine"; "RulesetName" = "vic-engine"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "vit"; "RulesetName" = "vit"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "vMotion"; "RulesetName" = "vMotion"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "vpxHeartbeats"; "RulesetName" = "VMware vCenter Agent"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "vsanEncryption"; "RulesetName" = "vsanEncryption"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "vsanhealth-unicasttest"; "RulesetName" = "vsanhealth-unicasttest"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "vSPC"; "RulesetName" = "VM serial port connected to vSPC"},
# Note doing the "vSphere Web Client" service this way may disable access but may be done through vCenter or through the console.
#    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "vSphereClient"; "RulesetName" = "vSphere Web Client"},
    @{"AllowedAll" = $false; "Enabled" = $false; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "vvold"; "RulesetName" = "vvold"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "webAccess"; "RulesetName" = "vSphere Web Access"},
    @{"AllowedAll" = $false; "Enabled" = $true; "IPAddress" = "192.168.0.0/16"; "RulesetID" = "WOL"; "RulesetName" = "WOL"}

$allVMhosts = Get-VMHost

foreach ($vmhost in $allVMhosts) {
    $esxcli = Get-EsxCli -VMHost $vmhost -v2

    # Check if VMware ESXi Version is 6.7
    if($vmhost.Version -notlike "6.7.0") {
        Write-Host -NoNewline -ForegroundColor Red "Warning: "
        Write-Host "This host is not version 6.7.0!"
        Continue
    }
     
    foreach($firewallRuleset in $firewallRulesets) {
        # Header line for the individual Firewall Rule
        Write-Host -NoNewline -ForegroundColor Yellow "Firewall Rule Name: "
        Write-Host -NoNewLine $firewallRuleset.item("RuleSetName")"("$firewallRuleset.item("RuleSetID")") "
        if($firewallRuleset.item("Enabled")) {
            Write-Host -ForegroundColor DarkBlue "[Enabled]"
        } else {
            Write-Host -ForegroundColor DarkGray "[Disabled]"
        }

        # Check if AllowedAll is set
        $isCurrentlyAllowedAll = $(Get-VMHost -Name $vmhost | Get-VMHostFirewallException | Where-Object -Property Name -Like $firewallRuleset.item("RuleSetName") | Select-Object Name,Enabled,@{N="AllIPEnabled";E={$_.ExtensionData.AllowedHosts.AllIP}}).AllIPEnabled
        # Get list of current IP addresses -- if the AllowedAll true, this will be "All"
        $currentIPAddress = $($esxcli.network.firewall.ruleset.allowedip.list.Invoke() | Where-Object -Property Ruleset -Like $firewallRuleset.item("RuleSetID")).AllowedIPAddresses

        # If the Firewall Rule currently set true (allowing all), set false
        if($isCurrentlyAllowedAll -like $true) {
            # This disables the allow all rule for the target service.
            $arguments = $esxcli.network.firewall.ruleset.set.CreateArgs()
            $arguments.rulesetid = $firewallRuleset.item("RuleSetID")
            $arguments.allowedall = $firewallRuleset.item("AllowedAll")
            #$arguments.enabled = $firewallRuleset.item("Enabled")
            $arguments
            $esxcli.network.firewall.ruleset.set.Invoke($arguments)
        }

        # After the AllowedAll is set to false, any IP addresses in the list will now be available
        $currentIPAddressAfter = $($esxcli.network.firewall.ruleset.allowedip.list.Invoke() | Where-Object -Property Ruleset -Like $firewallRuleset.item("RuleSetID")).AllowedIPAddresses

        # If the Firewall Rule AllowedAll was true, the address would have been "All" or "" (no value/null). 
        if($currentIPAddress -like "All" -or $currentIPAddress -like "") {
            if ($showComments) {
                Write-Host -ForegroundColor Yellow -NoNewline "IP address before AllowedAll: "
                Write-Host $currentIPAddress
                Write-Host -ForegroundColor Yellow -NoNewline "IP address after AllowedAll: "
                Write-Host $currentIPAddressAfter
            }
            
            # After setting the AllowedAll to false, if there was a previous value in the IP address list, 
            # we need to make sure it matches the desired list from above. If not, then set to desired value.
            if($currentIPAddressAfter -notlike $firewallRuleset.item("IPAddress")) {
                # Add the allowed IPs for the service.
                $arguments = $esxcli.network.firewall.ruleset.allowedip.add.CreateArgs()
                $arguments.rulesetid = $firewallRuleset.item("RuleSetID")
                $arguments.ipaddress = $firewallRuleset.item("IPAddress")
                $arguments
                $esxcli.network.firewall.ruleset.allowedip.add.Invoke($arguments)
            }
        }
    }
}

if($doPause) {
    Pause
}
Write-Separator
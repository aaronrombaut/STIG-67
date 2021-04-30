# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must display the Standard Mandatory DoD Notice and Consent Banner before granting access to the system via the DCUI."

$allVMhosts = Get-VMHost

$value = @"
{bgcolor:black} {/color}{align:left}{bgcolor:black}{color:yellow}{hostname} , {ip}{/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:black}{color:yellow}{esxproduct} {esxversion}{/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:black}{color:yellow}{memory} RAM{/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:black}{color:white} {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} You are accessing a U.S. Government (USG) Information System (IS) that is provided for USG-authorized use only. By {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} using this IS (which includes any device attached to this IS), you consent to the following conditions: {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} - The USG routinely intercepts and monitors communications on this IS for purposes including, but not limited {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} to, penetration testing, COMSEC monitoring, network operations and defense, personnel misconduct (PM), law {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} enforcement (LE), and counterintelligence (CI) investigations. {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} - At any time, the USG may inspect and seize data stored on this IS. {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} - Communications using, or data stored on, this IS are not private, are subject to routine monitoring, {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} interception, and search, and may be disclosed or used for any USG-authorized purpose. {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} - This IS includes security measures (e.g., authentication and access controls) to protect USG interests--not {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} for your personal benefit or privacy. {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} - Notwithstanding the above, using this IS does not constitute consent to PM, LE or CI investigative searching {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} or monitoring of the content of privileged communications, or work product, related to personal representation {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} or services by attorneys, psychotherapists, or clergy, and their assistants. Such communications and work {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} product are private and confidential. See User Agreement for details. {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{align:left}{bgcolor:yellow}{color:black} {/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
{bgcolor:black} {/color}{align:left}{bgcolor:dark-grey}{color:white} <F2> Accept Conditions and Customize System / View Logs{/align}{align:right}<F12> Accept Conditions and Shut Down/Restart {bgcolor:black} {/color}{/color}{/bgcolor}{/align}
{bgcolor:black} {/color}{bgcolor:dark-grey}{color:black} {/color}{/bgcolor}
"@

foreach ($vmhost in $allVMhosts) {
    Get-VMHost -Name $vmhost |
     Get-AdvancedSetting -Name Annotations.WelcomeMessage |
     Set-AdvancedSetting -Value $value -Confirm:$false | 
     Format-Table -AutoSize

    if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
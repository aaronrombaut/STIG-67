# Include functions
. .\functions.ps1

Write-STIGRule "The ESXi host must use Active Directory for local user authentication."

$allVMhosts = Get-VMHost
$domainName = "aaronrombaut.com"
$domainUser = "" # Leave blank for security reasons; will prompt
$domainPassword = "" # Leave blank for security reasons; will prompt

foreach ($vmhost in $allVMhosts) {
    # Test if already domain joined to avoid errors
    if($(Get-VMHost -Name $vmhost | Get-VMHostAuthentication).DomainMembershipStatus -like "Ok") {
        Write-Host -ForegroundColor Yellow -NoNewline $vmhost 
        Write-Host " is already domain joined...skipping"
    } else {
        Get-VMHost -Name $vmhost |
         Get-VMHostAuthentication |
         Set-VMHostAuthentication -JoinDomain -Domain $domainName #-User $domainUser -Password $domainPassword
    }
     if ($showComments) {
        
    }
}

if($doPause) {
    Pause
}
Write-Separator
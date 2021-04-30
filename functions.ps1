function Write-Separator {
    Write-Host ""
    Write-Host "----------------------------------------"
    Write-Host ""
}

function Write-STIGRule {
    param($STIGRule)
    Write-Host -ForegroundColor Green -NoNewline "Rule Title: "
    Write-Host $STIGRule
}
# Deploy der VSCode Extension zum Marketplace
# 001, 210328 130720

# Config
$Publisher = 'TomSchi'
$ExtensionDir = 'mindcode'


Function Get-vsce-Logins() {
	vsce ls-publishers
}




## Main


$Res = pwd
Write-Host 'Arbeits-Verzeichnis:' -ForegroundColor Magenta
Write-Host $Res.Path

CD $ExtensionDir
$Res = pwd
Write-Host 'Extension-Verzeichnis' -ForegroundColor Magenta
Write-Host $Res.Path

Write-Host "`n1/3: Paketieren" -ForegroundColor Yellow
vsce package

Write-Host "`n2/3: Login" -ForegroundColor Yellow
If ((Get-vsce-Logins).Contains($Publisher)) {
	Write-Host '  OK' -ForegroundColor Green
} Else {
	vsce login $Publisher
}


Write-Host "`n3/3: Publish" -ForegroundColor Yellow
Write-Host "Token: KeePass:" -ForegroundColor Cyan
Write-Host "MSMarketplacePublisher@jig.ch`n" -ForegroundColor Cyan
vsce publish

Start-Sleep -Seconds 5


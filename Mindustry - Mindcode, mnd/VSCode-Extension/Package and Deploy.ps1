# Deploy der VSCode Extension zum Marketplace
$ExtensionDir = 'mindcode'

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
vsce login TomSchi

Write-Host "`n3/3: Publish" -ForegroundColor Yellow
Write-Host "`nToken: KeePass:" -ForegroundColor Cyan
Write-Host "MSMarketplacePublisher@jig.ch`n" -ForegroundColor Cyan
vsce publish

Start-Sleep -Seconds 5


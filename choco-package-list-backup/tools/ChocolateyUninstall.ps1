$packageName  = 'choco-package-list-backup' 
$toolsDir     = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$script       = "choco-package-list-backup.ps1"

Remove-Item $env:ChocolateyInstall\bin\$script -Force -ErrorAction 'SilentlyContinue'

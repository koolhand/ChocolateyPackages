﻿$ErrorActionPreference = 'Stop'
$packageName = 'intel-rst-driver' 
$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url         = 'https://downloadmirror.intel.com/29647/eng/SetupRST.exe'
$checksum    = '957D8353537032E4D49A0B15FC3C1C46CFCCC6D4BB180A0BBAAE6C91BCBFE452'

if ((Get-IsWin10 -eq $false) -and (Get-IsWinServer2016 -eq $false)){
   Write-Warning "  ** This version is Windows 10 and Windows Server 2016 only."
   throw
}

if (Get-PendingReboot -eq $true){
   Write-Warning "  ** There is a pending reboot. Please reboot and try again."
   throw
}

$packageArgs = @{
  packageName    = $packageName
  unzipLocation  = $toolsDir
  fileType       = 'EXE' 
  url            = $url
  checksum       = $checksum
  checksumType   = 'sha256'  
  silentArgs     = '-s' 
  softwareName   = 'Intel(R) Rapid Storage Technology' 
  validExitCodes = @(0, 3010, 1641)
  }

Install-ChocolateyPackage @packageArgs

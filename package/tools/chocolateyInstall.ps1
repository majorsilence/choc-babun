$packageName = 'babun'

function RemoveOldBabun
{
  $babunpath = Join-Path $env:USERPROFILE ".babun"
  if (Test-Path $babunpath)
  {
    Remove-Item -Recurse -Force $babunpath
  }
}

function RunBabunInstall($unzipPath)
{
    RemoveOldBabun
    $setupBat = Join-Path $unzipPath "babun"
    $setupBat = Join-Path $unzipPath "install.bat"
    start-process $setupBat
}

$url = 'http://projects.reficio.org/babun/download';
$unzipPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage $packageName $url $unzipPath
RunBabunInstall $unzipPath

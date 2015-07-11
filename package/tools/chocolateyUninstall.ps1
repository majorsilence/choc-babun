
$packageName = 'babun'
UnInstall-ChocolateyZipPackage packageName 'babun-1.2.0-dist.zip'

$babunpath = Join-Path $env:USERPROFILE ".babun"
if (Test-Path $babunpath)
{
    $updateBat = Join-Path $babunpath "uninstall.bat"
    start-process echo Y | $updateBat -Wait
    Remove-Item -Recurse -Force $babunpath
}

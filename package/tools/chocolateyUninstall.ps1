
$packageName = 'babun'
UnInstall-ChocolateyZipPackage packageName 'babun-1.2.0-dist.zip'

$babunpath = Join-Path $env:USERPROFILE ".babun"
if (Test-Path $babunpath)
{
    $uninstallBat = Join-Path $babunpath "uninstall.bat"

    $command = "& {echo Y | `"$uninstallBat`"}"

    powershell -Command $command

    #start-process "$uninstallBat" -Wait
    Remove-Item -Recurse -Force $babunpath
}

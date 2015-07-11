$packageName = 'babun'

function RunBabunInstall($unzipPath)
{
    $babunpath = Join-Path $env:USERPROFILE ".babun"
    if (Test-Path $babunpath)
    {
        $updateBat = Join-Path $babunpath "update.bat"
        start-process $updateBat
    }
    else
    {
        $setupBat = Join-Path $unzipPath "babun"
        $setupBat = Join-Path $unzipPath "install.bat"
        start-process $setupBat
    }
}

$url = 'http://projects.reficio.org/babun/download';
$unzipPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
Install-ChocolateyZipPackage $packageName $url $unzipPath
RunBabunInstall $unzipPath

$packageName = 'babun'

function RunBabunInstall($unzipPath)
{
    $babunpath = Join-Path $env:USERPROFILE ".babun"
    $updateBat = Join-Path $babunpath "update.bat"
    if (Test-Path $updateBat)
    {
        start-process $updateBat -Wait
    }
    else
    {
        $setupBat = Join-Path $unzipPath "babun-1.2.0"
        $setupBat = Join-Path $setupBat "install.bat"
        start-process $setupBat #-Wait
    }
}

$url = 'http://projects.reficio.org/babun/download/babun-1.2.0-dist.zip';
$unzipPath = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$checksum = '89c0a51ea1d995be5b04b24cd795ba3eba713b293b43991f0c87e29300429b14'
Install-ChocolateyZipPackage $packageName $url $unzipPath -Checksum $checksum
RunBabunInstall $unzipPath

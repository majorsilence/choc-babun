$package = 'babun'

# ------------------------
#NOTE: Please remove any commented lines to tidy up prior to releasing the package, including this one

function RemoveOldBabun
{
  $babunpath = Join-Path $env:USERPROFILE ".babun"
  if (Test-Path $babunpath)
  {
    Remove-Item -Recurse -Force $babunpath 
  }
}

$packageName = $package;
$url = 'http://projects.reficio.org/babun/babun-dist.zip';

try {



  $chocTempDir = Join-Path $env:TEMP "chocolatey"
  $tempDir = Join-Path $chocTempDir "$packageName" 

  $setupBat = Join-Path $tempDir "babun-1.0.1"
  $setupBat = Join-Path $setupBat "install.bat"

  $zipFile = "babun.zip"
  
  $tempDownloadFolder 
  if (![System.IO.Directory]::Exists($tempDir)) {[System.IO.Directory]::CreateDirectory($tempDir)}
        
  $file = Join-Path $tempDir $zipFile
  Get-ChocolateyWebFile $packageName $file $url
  Get-ChocolateyUnzip $file $tempDir "" $packageName
  
  RemoveOldBabun
  start-process $setupBat


   # the following is all part of error handling
  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" "$($_.Exception.Message)"
  throw 
}

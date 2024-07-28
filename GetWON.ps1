$adbDir = Join-Path $env:SystemDrive "adb"
if (-not (Test-Path $adbDir -PathType Container)) {
    New-Item -Path $adbDir -ItemType Directory
}

$platformToolsUrl = "https://dl.google.com/android/repository/platform-tools-latest-windows.zip"
$platformToolsZip = Join-Path $adbDir "platform-tools-latest-windows.zip"
Invoke-WebRequest -Uri $platformToolsUrl -OutFile $platformToolsZip
Expand-Archive -Path $platformToolsZip -DestinationPath $adbDir -Force
Remove-Item -Path $platformToolsZip -Force
$platformToolsDir = Join-Path $adbDir "platform-tools"
$wonDeployerDir = Join-Path $env:USERPROFILE ".arkt"
if (-not (Test-Path $wonDeployerDir -PathType Container)) {
    New-Item -Path $wonDeployerDir -ItemType Directory
}

$filesToDownload = @{
    "won-deployer.exe" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/won_deployer.exe"
    "win_img.exe" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/win_img.exe"
    "libwim-15.dll" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/libwim-15.dll"
}

foreach ($file in $filesToDownload.Keys) {
    $destinationPath = Join-Path $wonDeployerDir $file
    $url = $filesToDownload[$file]
    Invoke-WebRequest -Uri $url -OutFile $destinationPath
}

$currentPath = [Environment]::GetEnvironmentVariable("PATH", "User") -split ";"

if ($currentPath -notcontains $wonDeployerDir) {
    [Environment]::SetEnvironmentVariable("PATH", "$wonDeployerDir;$([Environment]::GetEnvironmentVariable('PATH', 'User'))", "User")
    Write-Host "WoN-Deployer directory added to PATH. Restart shell to apply changes"
}

if ($currentPath -notcontains $platformToolsDir) {
    [Environment]::SetEnvironmentVariable("PATH", "$platformToolsDir;$([Environment]::GetEnvironmentVariable('PATH', 'User'))", "User")
    Write-Host "Platform tools directory added to PATH. Restart shell to apply changes"
}

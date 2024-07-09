$wonDeployerDir = Join-Path $env:USERPROFILE ".arkt"
if (-not (Test-Path $wonDeployerDir -PathType Container)) {
    New-Item -Path $wonDeployerDir -ItemType Directory
}

$platformToolsUrl = "https://dl.google.com/android/repository/platform-tools-latest-windows.zip"
$platformToolsZip = Join-Path $wonDeployerDir "platform-tools-latest-windows.zip"
Invoke-WebRequest -Uri $platformToolsUrl -OutFile $platformToolsZip
Expand-Archive -Path $platformToolsZip -DestinationPath $env:USERPROFILE -Force
Remove-Item -Path $platformToolsZip -Force
$platformToolsDir = Join-Path $env:USERPROFILE "platform-tools"
$wonDeployerExe = Join-Path $wonDeployerDir "won-deployer.exe"
$wonDeployerUrl = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/won_deployer.exe"
Invoke-WebRequest -Uri $wonDeployerUrl -OutFile $wonDeployerExe

$currentPath = [Environment]::GetEnvironmentVariable("PATH", "User") -split ";"
if ($currentPath -notcontains $wonDeployerDir) {
    [Environment]::SetEnvironmentVariable("PATH", "$wonDeployerDir;$($env:PATH)", "User")
    $env:PATH="$wonDeployerDir;$($env:PATH)"
    Write-Host "WoN-Deployer added to PATH. Restart shell to apply changes"
    Write-Host "type  won-deployer  to run"
}

$currentPath = [Environment]::GetEnvironmentVariable("PATH", "User") -split ";"
if ($currentPath -notcontains $platformToolsDir) {
    [Environment]::SetEnvironmentVariable("PATH", "$platformToolsDir;$($env:PATH)", "User")
    Write-Host "Platform tools added to PATH. Restart shell to apply changes"
}

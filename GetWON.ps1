[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
$ProgressPreference = 'SilentlyContinue'
Clear-Host
Write-Host "`n                 ██╗    ██╗ ██████╗ ███╗   ██╗" -ForegroundColor Cyan
Write-Host "                 ██║    ██║██╔═══██╗████╗  ██║" -ForegroundColor Cyan
Write-Host "                 ██║ █╗ ██║██║   ██║██╔██╗ ██║" -ForegroundColor Cyan
Write-Host "                 ██║███╗██║██║   ██║██║╚██╗██║" -ForegroundColor DarkCyan
Write-Host "                 ╚███╔███╔╝╚██████╔╝██║ ╚████║" -ForegroundColor DarkCyan
Write-Host "                  ╚══╝╚══╝  ╚═════╝ ╚═╝  ╚═══╝" -ForegroundColor DarkCyan
Write-Host " ██████╗ ███████╗██████╗ ██╗      ██████╗ ██╗   ██╗███████╗██████╗ " -ForegroundColor Cyan
Write-Host " ██╔══██╗██╔════╝██╔══██╗██║     ██╔═══██╗╚██╗ ██╔╝██╔════╝██╔══██╗" -ForegroundColor Cyan
Write-Host " ██║  ██║█████╗  ██████╔╝██║     ██║   ██║ ╚████╔╝ █████╗  ██████╔╝" -ForegroundColor Cyan
Write-Host " ██║  ██║██╔══╝  ██╔═══╝ ██║     ██║   ██║  ╚██╔╝  ██╔══╝  ██╔══██╗" -ForegroundColor DarkCyan
Write-Host " ██████╔╝███████╗██║     ███████╗╚██████╔╝   ██║   ███████╗██║  ██║" -ForegroundColor DarkCyan
Write-Host " ╚═════╝ ╚══════╝╚═╝     ╚══════╝ ╚═════╝    ╚═╝   ╚══════╝╚═╝  ╚═╝" -ForegroundColor DarkCyan
Write-Host ""
Write-Host "                          - S E T U P -                            " -ForegroundColor Gray
Write-Host ""

# Set up directories
$adbDir = Join-Path $env:SystemDrive "adb"
$wonDeployerDir = Join-Path $env:USERPROFILE ".arkt"
$wonFilesDir = Join-Path $wonDeployerDir "files"
$dismbinDir = Join-Path $wonDeployerDir "dismbin"

# Create directories if they don't exist
foreach ($dir in @($adbDir, $wonDeployerDir, $wonFilesDir)) {
    if (-not (Test-Path $dir -PathType Container)) {
        Write-Host "Creating directory: $dir" -ForegroundColor Cyan
        
        try {
            # Attempt to create the directory
			$null = New-Item -Path $dir -ItemType Directory -ErrorAction SilentlyContinue
        } catch {
            # Display the error message if directory creation fails
            Write-Host "Error creating directory: $dir`n$($_.Exception.Message)" -ForegroundColor Red
        }
    }
}

# Download llinks
$platformTools = @{ "platform-tools.zip" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/platform-tools.zip" }
$dismbin = @{ "dismbin.zip" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/dism-bin.zip" }

$filesToDownload = @{
    "won-deployer.exe" = "https://pub-b90d2836b1d44c13ba332b578d80b42b.r2.dev/won_deployer.exe"
    "wimlib-imagex.exe" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/wimlib-imagex.exe"
    "libwim-15.dll" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/libwim-15.dll"
}

$requiredFilesDownload = @{
    "Toolbox.zip" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/Toolbox.zip"
    "sta.zip" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/sta.zip"
    "Magisk_stable.apk" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/Magisk_stable.apk"
    "twrp.img" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/twrp.img"
    "gpt_both0.bin" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/gpt_both0.bin"
    "userdata.img" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/userdata.img"
    "uefi.img" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/uefi.img"
    "uefiNyankoSensei.img" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/uefiNyankoSensei.img"
}

# Modern progress bar function
function Show-Progress {
    param (
        [Parameter(Mandatory)]
        [Single]$TotalValue,
        
        [Parameter(Mandatory)]
        [Single]$CurrentValue,
        
        [Parameter(Mandatory)]
        [string]$ProgressText,
        
        [Parameter()]
        [string]$ValueSuffix,
        
        [Parameter()]
        [int]$BarSize = 40,

        [Parameter()]
        [switch]$Complete
    )
    
    $percent = $CurrentValue / $TotalValue
    $percentComplete = $percent * 100
    if ($ValueSuffix) {
        $ValueSuffix = " $ValueSuffix"
    }
    if ($psISE) {
        Write-Progress "$ProgressText $CurrentValue$ValueSuffix of $TotalValue$ValueSuffix" -id 0 -percentComplete $percentComplete            
    }
    else {
        $curBarSize = $BarSize * $percent
        $progbar = ""
        $progbar = $progbar.PadRight($curBarSize,[char]9608)
        $progbar = $progbar.PadRight($BarSize,[char]9617)
        
        if (!$Complete.IsPresent) {
            Write-Host -NoNewLine "`r$ProgressText $progbar [ $($CurrentValue.ToString("#.###").PadLeft($TotalValue.ToString("#.###").Length))$ValueSuffix / $($TotalValue.ToString("#.###"))$ValueSuffix ] $($percentComplete.ToString("##0.00").PadLeft(6)) % complete"
        }
        else {
            Write-Host -NoNewLine "`r$ProgressText $progbar [ $($TotalValue.ToString("#.###").PadLeft($TotalValue.ToString("#.###").Length))$ValueSuffix / $($TotalValue.ToString("#.###"))$ValueSuffix ] $($percentComplete.ToString("##0.00").PadLeft(6)) % complete"                    
        }                
    }   
}

# Download files with progress and size display
function Download-Files($files, $destinationDir) {
    $maxRetries = 3

    foreach ($file in $files.Keys) {
        $destinationPath = Join-Path $destinationDir $file
        $url = $files[$file]
        $retryCount = 0
        $success = $false

        Write-Host "`n" 

        while (-not $success -and $retryCount -lt $maxRetries) {
            try {
                $storeEAP = $ErrorActionPreference
                $ErrorActionPreference = 'Stop'

                $response = Invoke-WebRequest -Uri $url -Method Head -UseBasicParsing
                [long]$fileSizeBytes = [int]$response.Headers['Content-Length']
                $fileSizeMB = $fileSizeBytes / 1MB

                $request = [System.Net.HttpWebRequest]::Create($url)
                $webResponse = $request.GetResponse()
                $responseStream = $webResponse.GetResponseStream()

                $fileStream = New-Object System.IO.FileStream($destinationPath, [System.IO.FileMode]::Create)
                $buffer = New-Object byte[] 4096
                [long]$totalBytesRead = 0

                $finalBarCount = 0

                do {
                    $bytesRead = $responseStream.Read($buffer, 0, $buffer.Length)
                    $fileStream.Write($buffer, 0, $bytesRead)
                    $totalBytesRead += $bytesRead
                    $totalMB = $totalBytesRead / 1MB
                    
                    if ($fileSizeBytes -gt 0) {
                        Show-Progress -TotalValue $fileSizeMB -CurrentValue $totalMB -ProgressText "Downloading $file" -ValueSuffix "MB"
                    }
                    
                    if ($totalBytesRead -eq $fileSizeBytes -and $bytesRead -eq 0 -and $finalBarCount -eq 0) {
                        Show-Progress -TotalValue $fileSizeMB -CurrentValue $totalMB -ProgressText "Downloading $file" -ValueSuffix "MB" -Complete
                        $finalBarCount++
                    }
                } while ($bytesRead -gt 0)

                $fileStream.Close()
                $responseStream.Close()
                $webResponse.Close()
                $ErrorActionPreference = $storeEAP
                [GC]::Collect()
                Unblock-File -Path $destinationPath -ErrorAction SilentlyContinue
                $success = $true
            }
            catch {
                $ExeptionMsg = $_.Exception.Message
                $retryCount++
                
                if ($null -ne $fileStream) { $fileStream.Close() }
                if ($null -ne $responseStream) { $responseStream.Close() }
                if ($null -ne $webResponse) { $webResponse.Close() }

                Write-Host "`n[Error] Download broken for $file : $ExeptionMsg" -ForegroundColor Red
                
                if ($retryCount -lt $maxRetries) {
                    Write-Host "Retrying ($retryCount/$maxRetries) in 2 seconds..." -ForegroundColor Yellow
                    Start-Sleep -Seconds 2
                } else {
                    Write-Host "`n[ERROR] Failed to download $file after $maxRetries attempts!" -ForegroundColor Red
                    Write-Host "Please check your internet connection or VPN/firewall and then run this again...`n" -ForegroundColor Yellow
                    exit
                }
            }
        }
    }
}


Write-Host "`nDownloading platform tools..." -ForegroundColor Cyan
Download-Files -files $platformTools -destinationDir $adbDir

Write-Host "`n`nExtracting platform tools..." -ForegroundColor Green
Expand-Archive -Path (Join-Path $adbDir "platform-tools.zip") -DestinationPath $adbDir -Force
Remove-Item -Path (Join-Path $adbDir "platform-tools.zip") -Force
$platformToolsDir = Join-Path $adbDir "\"

Write-Host "`n`nDownloading dism-en..." -ForegroundColor Cyan
Download-Files -files $dismbin -destinationDir $wonDeployerDir

Write-Host "`n`nExtracting dism-en..." -ForegroundColor Green
Expand-Archive -Path (Join-Path $wonDeployerDir "dismbin.zip") -DestinationPath $dismbinDir -Force
Remove-Item -Path (Join-Path $wonDeployerDir "dismbin.zip") -Force
$dismbinDir1 = Join-Path $wonDeployerDir "dismbin\"


# Download installer
Write-Host "`n`n`nDownloading Tool Files..." -ForegroundColor Cyan
Download-Files -files $filesToDownload -destinationDir $wonDeployerDir

# Update PATH environment variable
Write-Host ""
Write-Host ""
Write-Host ""
$currentPath = [Environment]::GetEnvironmentVariable("PATH", "User") -split ";"
$pathsToAdd = @($wonDeployerDir, $platformToolsDir, $dismbinDir1)

foreach ($path in $pathsToAdd) {
    if ($currentPath -notcontains $path) {
        [Environment]::SetEnvironmentVariable("PATH", "$path;$([Environment]::GetEnvironmentVariable('PATH', 'User'))", "User")
        $env:PATH = "$path;$env:PATH"
        Write-Host "$path added to PATH..." -ForegroundColor Magenta
    }
}


# Download additional files
Write-Host "`nDownloading Additional Required Files" -ForegroundColor Cyan
Download-Files -files $requiredFilesDownload -destinationDir $wonFilesDir

Write-Host "`n`nDownload attempts complete." -ForegroundColor Green

if (-not (Test-Path "$wonDeployerDir\won-deployer.exe")) {
    Write-Host "`n===========================================" -ForegroundColor Red
    Write-Host "[ERROR] won-deployer.exe was not found!" -ForegroundColor Red
    Write-Host "The installation is failed, please check your network and try again!" -ForegroundColor Yellow
    Write-Host "===========================================`n" -ForegroundColor Red
    exit
}

Write-Host "`n===========================================" -ForegroundColor DarkCyan
Write-Host "Tool installation completed successfully!" -ForegroundColor Yellow
Write-Host "===========================================" -ForegroundColor DarkCyan

Write-Host "`n How to run the tool later:`n" -ForegroundColor Cyan
Write-Host " Step 1. Re-open a new PowerShell/Terminal as Administrator.`n" -ForegroundColor Yellow
Write-Host -NoNewline " Step 2. Then type " -ForegroundColor Magenta
Write-Host -NoNewline "'won-deployer'" -ForegroundColor Yellow
Write-Host " to run the tool.`n" -ForegroundColor Magenta
Write-Host "===================================================================" -ForegroundColor DarkCyan
Write-Host "Note: You can ignore any error that may appear below this message." -ForegroundColor Yellow
Write-Host "===================================================================`n" -ForegroundColor DarkCyan

# Exclude won-deployer.exe from Microsoft Defender
Add-MpPreference -ExclusionPath $wonDeployerDir -ErrorAction SilentlyContinue
# Prompt to run now
Write-Host "`nDo you want to start won-deployer now? (y/n):" -ForegroundColor Cyan 
$response = Read-Host "> "

if ([string]::IsNullOrWhiteSpace($response) -or $response.ToLower() -match '^(y|yes|ye|ys|ues|yeah|yep)$') {
    Write-Host "`nLaunching won-deployer...`n`n" -ForegroundColor Green
    Start-Sleep -Milliseconds 500
    $isAdmin = ([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)
    $isWT = [bool]$env:WT_SESSION
    $wtInstalled = [bool](Get-Command "wt.exe" -ErrorAction SilentlyContinue)
    try {
        if ($wtInstalled -and (-not ($isAdmin -and $isWT))) {
            Start-Process "wt.exe" -ArgumentList "-M powershell.exe -NoExit -Command `"& '$wonDeployerDir\won-deployer.exe'`"" -Verb RunAs -ErrorAction Stop
        } else {
            & "$wonDeployerDir\won-deployer.exe"
        }
    } catch {
        Write-Host "Launch canceled by you..." -ForegroundColor Red
        Write-Host "won-deployer requires Administrator privileges to run!`n`n"
        Write-Host -NoNewline "You can launch it anytime by typing " -ForegroundColor Cyan
        Write-Host -NoNewline "'won-deployer'" -ForegroundColor Yellow
        Write-Host " in a new terminal/PowerShell (Admin) window.`n" -ForegroundColor Cyan
    }
} else {
    Write-Host ""
    Write-Host -NoNewline "You can launch it anytime by typing " -ForegroundColor Cyan
    Write-Host -NoNewline "'won-deployer'" -ForegroundColor Yellow
    Write-Host " in a new terminal/PowerShell (Admin) window.`n" -ForegroundColor Cyan
}

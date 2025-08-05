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

# Download platform tools
$platformToolsZip = Join-Path $adbDir "platform-tools.zip"
$dismbinZip = Join-Path $wonDeployerDir "dismbin.zip"

$platformTools = @{
     "platform-tools.zip" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/platform-tools.zip"
}

$dismbin = @{
     "dismbin.zip" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/dism-bin.zip"
}

# Define the file to download
$filesToDownload = @{
    "won-deployer.exe" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/won_deployer.exe"
    "wimlib-imagex.exe" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/wimlib-imagex.exe"
    "libwim-15.dll" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/libwim-15.dll"
}

# Define the additional file to download
$requiredFilesDownload = @{
    "Toolbox.zip" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/Toolbox.zip"
    "sta.zip" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/sta.zip"
    #"Magisk_canary.apk" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/Magisk_canary.apk"
    "Magisk_stable.apk" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/Magisk_stable.apk"
    #"Magisk_kitsune.apk" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/Magisk_kitsune.apk"
    #"orangefox.img" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/orangefox.img"
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
    $totalFiles = $files.Count
    $currentFile = 0

    foreach ($file in $files.Keys) {
        $currentFile++
        $destinationPath = Join-Path $destinationDir $file
        $url = $files[$file]

        try {
            $storeEAP = $ErrorActionPreference
            $ErrorActionPreference = 'Stop'

            $response = Invoke-WebRequest -Uri $url -Method Head
            [long]$fileSizeBytes = [int]$response.Headers['Content-Length']
            $fileSizeMB = $fileSizeBytes / 1MB

            if ($fileSizeBytes -eq $null) {
                $fileSize = "Unknown"
            } else {
                $fileSize = [math]::Round($fileSizeBytes / 1MB, 2)
            }
			
           Write-Host "" 
          #Write-Host "Downloading $file ($fileSize MB)..." -ForegroundColor Yellow
		   Write-Host "" 

            # Start downloading the file and display progress
            $request = [System.Net.HttpWebRequest]::Create($url)
            $webResponse = $request.GetResponse()
            $responseStream = $webResponse.GetResponseStream()

            $fileStream = New-Object System.IO.FileStream($destinationPath, [System.IO.FileMode]::Create)
            $buffer = New-Object byte[] 4096
            [long]$totalBytesRead = 0
            [long]$bytesRead = 0

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
        }
        catch {
            $ExeptionMsg = $_.Exception.Message
            Write-Host "Download breaks with error : $ExeptionMsg"
        }
    }
}


Write-Host ""
Write-Host "Downloading platform tools..." -ForegroundColor Cyan
Download-Files -files $platformTools -destinationDir $adbDir
Write-Host ""
Write-Host ""
Write-Host "Extracting platform tools..." -ForegroundColor Green
Expand-Archive -Path $platformToolsZip -DestinationPath $adbDir -Force
Remove-Item -Path $platformToolsZip -Force
$platformToolsDir = Join-Path $adbDir "platform-tools\"
$platformToolsDir = Join-Path $adbDir "\"
Write-Host ""

Write-Host ""
Write-Host "Downloading dism-en..." -ForegroundColor Cyan
Download-Files -files $dismbin -destinationDir $wonDeployerDir
Write-Host ""
Write-Host ""
Write-Host "Extracting dism-en..." -ForegroundColor Green
Expand-Archive -Path $dismbinZip -DestinationPath $dismbinDir -Force
Remove-Item -Path $dismbinZip -Force
$dismbinDir1 = Join-Path $wonDeployerDir "dismbin\"
Write-Host ""


# Download installer
Write-Host ""
Write-Host ""
Write-Host "Downloading Tool" -ForegroundColor Cyan
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
        Write-Host "$path added to PATH. Restart this shell to apply changes." -ForegroundColor Magenta
    }
}


# Download additional files
Write-Host ""
Write-Host "Downloading Additional Required Files" -ForegroundColor Cyan
Download-Files -files $requiredFilesDownload -destinationDir $wonFilesDir

Write-Host ""
Write-Host ""
Write-Host "Download complete." -ForegroundColor Green


Write-Host ""
Write-Host "===========================================" -ForegroundColor DarkCyan
Write-Host "Tool installation completed successfully!" -ForegroundColor Yellow
Write-Host "===========================================" -ForegroundColor DarkCyan
Write-Host ""
Write-Host " How to run the tool later:" -ForegroundColor Cyan
Write-Host ""
Write-Host " Step 1. Re-open a new PowerShell/Terminal as Administrator." -ForegroundColor Yellow
Write-Host ""
Write-Host -NoNewline " Step 2. Then type " -ForegroundColor Magenta
Write-Host -NoNewline "'won-deployer'" -ForegroundColor Yellow
Write-Host " to run the tool." -ForegroundColor Magenta
Write-Host ""
Write-Host "===================================================================" -ForegroundColor DarkCyan
Write-Host "Note: You can ignore any error that may appear below this message." -ForegroundColor Yellow
Write-Host "===================================================================" -ForegroundColor DarkCyan
Write-Host ""
# Exclude won-deployer.exe from Microsoft Defender
Add-MpPreference -ExclusionPath $wonDeployerDir
# Prompt to run now
Write-Host ""
Write-Host "Do you want to start won-deployer now? (y/n):" -ForegroundColor Cyan 
$response = Read-Host "> "

if ($response.ToLower() -match '^(y|yes|ye|ys|ues|yeah|yep)$') {
    Write-Host ""
    Write-Host "Launching won-deployer in this terminal..." -ForegroundColor Green
    Start-Sleep -Milliseconds 500
	Write-Host ""
	Write-Host ""
	Write-Host ""
    & "$wonDeployerDir\won-deployer.exe"
} else {
    Write-Host ""
    Write-Host -NoNewline "You can launch it anytime by typing " -ForegroundColor Cyan
    Write-Host -NoNewline "'won-deployer'" -ForegroundColor Yellow
    Write-Host " in a new terminal/PowerShell window." -ForegroundColor Cyan
    Write-Host ""
}

# Set up directories
$adbDir = Join-Path $env:SystemDrive "adb"
$wonDeployerDir = Join-Path $env:USERPROFILE ".arkt"
$wonFilesDir = Join-Path $wonDeployerDir "files"

# Create directories if they don't exist
foreach ($dir in @($adbDir, $wonDeployerDir, $wonFilesDir)) {
    if (-not (Test-Path $dir -PathType Container)) {
        Write-Host "Creating directory: $dir" -ForegroundColor Cyan
        New-Item -Path $dir -ItemType Directory
    }
}

# Download platform tools
$platformToolsUrl = "https://dl.google.com/android/repository/platform-tools-latest-windows.zip"
$platformToolsZip = Join-Path $adbDir "platform-tools-latest-windows.zip"

Write-Host ""
Write-Host "Downloading platform tools..." -ForegroundColor Cyan
Invoke-WebRequest -Uri $platformToolsUrl -OutFile $platformToolsZip
Write-Host "Extracting platform tools..." -ForegroundColor Green
Expand-Archive -Path $platformToolsZip -DestinationPath $adbDir -Force
Remove-Item -Path $platformToolsZip -Force
$platformToolsDir = Join-Path $adbDir "platform-tools"

# Define files to download
$filesToDownload = @{
    "won-deployer.exe" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/won_deployer.exe"
    "wimlib-imagex.exe" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/wimlib-imagex.exe"
    "libwim-15.dll" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/libwim-15.dll"
}

$requiredFilesDownload = @{
    "Toolbox.zip" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/Toolbox.zip"
    "sta.zip" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/sta.zip"
    "Magisk_stable.apk" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/Magisk_stable.apk"
    #"Magisk_kitsune.apk" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/Magisk_kitsune.apk"
    "orangefox.img" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/orangefox.img"
    "twrp.img" = "https://media.githubusercontent.com/media/ArKT-7/won-deployer/main/files/twrp.img"
    "gpt_both0.bin" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/gpt_both0.bin"
    "userdata.img" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/userdata.img"
	"uefi.img" = "https://raw.githubusercontent.com/arkt-7/won-deployer/main/files/uefi.img"
}

# Download files with progress and size display
function Download-Files($files, $destinationDir) {
    $totalFiles = $files.Count
    $currentFile = 0

    foreach ($file in $files.Keys) {
        $currentFile++
        $destinationPath = Join-Path $destinationDir $file
        $url = $files[$file]

        # Get the content length (file size)
        $response = Invoke-WebRequest -Uri $url -Method Head
        $fileSizeBytes = [int]$response.Headers['Content-Length']
        
        if ($fileSizeBytes -eq $null) {
            $fileSize = "Unknown"
        } else {
            $fileSize = [math]::Round($fileSizeBytes / 1MB, 2)
        }

        Write-Host "Downloading $file ($fileSize MB)..." -ForegroundColor Yellow

        # Start downloading the file and display progress
        $webRequest = [System.Net.HttpWebRequest]::Create($url)
        $webResponse = $webRequest.GetResponse()
        $responseStream = $webResponse.GetResponseStream()

        $fileStream = New-Object System.IO.FileStream($destinationPath, [System.IO.FileMode]::Create)
        $buffer = New-Object byte[] 4096
        $totalBytesRead = 0
        $bytesRead = $responseStream.Read($buffer, 0, $buffer.Length)

        while ($bytesRead -gt 0) {
            $fileStream.Write($buffer, 0, $bytesRead)
            $totalBytesRead += $bytesRead
            $bytesRead = $responseStream.Read($buffer, 0, $buffer.Length)
            if ($fileSizeBytes -gt 0) {
                $percentComplete = [math]::Round(($totalBytesRead / $fileSizeBytes) * 100, 2)
                Write-Progress -Activity "Downloading Files" `
                               -Status "Downloading $file ($currentFile of $totalFiles) - $percentComplete% completed" `
                               -PercentComplete $percentComplete
            }
        }

        $fileStream.Close()
        $responseStream.Close()
        $webResponse.Close()
    }
}

# Download installer
Write-Host ""
Write-Host "Downloading Tool" -ForegroundColor Cyan
Download-Files -files $filesToDownload -destinationDir $wonDeployerDir

# Update PATH environment variable
Write-Host ""
$currentPath = [Environment]::GetEnvironmentVariable("PATH", "User") -split ";"
$pathsToAdd = @($wonDeployerDir, $platformToolsDir)

foreach ($path in $pathsToAdd) {
    if ($currentPath -notcontains $path) {
        [Environment]::SetEnvironmentVariable("PATH", "$path;$([Environment]::GetEnvironmentVariable('PATH', 'User'))", "User")
        Write-Host "$path added to PATH. Restart this shell to apply changes." -ForegroundColor Magenta
    }
}

# Download additional files
Write-Host ""
Write-Host "Downloading minimal Additional Required Files" -ForegroundColor Cyan
Download-Files -files $requiredFilesDownload -destinationDir $wonFilesDir

Write-Host ""
Write-Host ""
Write-Host "Please close this PowerShell/Terminal" -ForegroundColor Magenta
Write-Host ""
Write-Host "After reopening PowerShell/Terminal as Admin" -ForegroundColor Yellow
Write-Host ""
Write-Host -NoNewline "Type " -ForegroundColor Magenta
Write-Host -NoNewline "won-deployer" -ForegroundColor Yellow
Write-Host " to run the tool" -ForegroundColor Magenta
# Exclude won-deployer.exe from Microsoft Defender
#$wonDeployerPath = Join-Path $wonDeployerDir "won-deployer.exe"
#Write-Host ""
# Write-Host "Adding won-deployer.exe to Defender exclusion list just in case if defender detect it wrong by mistake..." -ForegroundColor Cyan
Add-MpPreference -ExclusionPath $wonDeployerDir

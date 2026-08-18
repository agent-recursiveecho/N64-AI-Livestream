$Url = Read-Host "Enter the model download URL"
$ExpectedHash = Read-Host "Enter the expected SHA-256 hash"

$DefaultDestination = "C:\Users\Living Room\workspace\N64-AI-Livestream\comfyui-portable\ComfyUI\models\checkpoints"
$Destination = Read-Host "Enter destination folder or press Enter for $DefaultDestination"

if ([string]::IsNullOrWhiteSpace($Destination)) {
    $Destination = $DefaultDestination
}

if (-not (Test-Path $Destination)) {
    Write-Error "Destination folder does not exist: $Destination"
    exit 1
}

try {
    $Uri = [System.Uri]$Url
    $FileName = [System.IO.Path]::GetFileName($Uri.AbsolutePath)
}
catch {
    Write-Error "The supplied URL is not valid."
    exit 1
}

if ([string]::IsNullOrWhiteSpace($FileName)) {
    Write-Error "Could not determine a filename from the URL."
    exit 1
}

$File = Join-Path $Destination $FileName
$ExpectedHash = $ExpectedHash.Trim().ToUpper()

if ($ExpectedHash -notmatch "^[A-F0-9]{64}$") {
    Write-Error "Expected SHA-256 must contain exactly 64 hexadecimal characters."
    exit 1
}

Write-Host ""
Write-Host "Model verification plan"
Write-Host "-----------------------"
Write-Host "URL:         $Url"
Write-Host "File:        $FileName"
Write-Host "Destination: $Destination"
Write-Host "SHA-256:     $ExpectedHash"
Write-Host ""

if (-not (Test-Path $File)) {
    $Download = Read-Host "File is not present. Download it now? (Y/N)"

    if ($Download -match "^[Yy]$") {
        Write-Host "Downloading $FileName..."

        try {
            Invoke-WebRequest -Uri $Url -OutFile $File
        }
        catch {
            Write-Error "Download failed: $($_.Exception.Message)"
            exit 1
        }
    }
    else {
        Write-Host "Download cancelled."
        exit 0
    }
}
else {
    Write-Host "Existing file found. Download skipped."
}

Write-Host ""
Write-Host "Calculating SHA-256..."
$Item = Get-Item $File
$ActualHash = (Get-FileHash $File -Algorithm SHA256).Hash.ToUpper()

Write-Host ""
Write-Host "Verification results"
Write-Host "--------------------"
Write-Host "File:          $($Item.Name)"
Write-Host "Size:          $($Item.Length) bytes"
Write-Host "Expected hash: $ExpectedHash"
Write-Host "Actual hash:   $ActualHash"
Write-Host ""

if ($ActualHash -eq $ExpectedHash) {
    Write-Host "PASS: SHA-256 matches the expected value."
    exit 0
}
else {
    Write-Warning "FAIL: SHA-256 does not match the expected value."
    Write-Warning "Do not load this model into ComfyUI until the discrepancy is resolved."
    exit 1
}

param(
    [string]$File = "C:\Users\Living Room\workspace\N64-AI-Livestream\comfyui-portable\ComfyUI\models\checkpoints\v1-5-pruned-emaonly-fp16.safetensors"
)

$ExpectedHash = "E9476A13728CD75D8279F6EC8BAD753A66A1957CA375A1464DC63B37DB6E3916"
$ExpectedSize = 2132696762

if (-not (Test-Path $File)) {
    Write-Error "Checkpoint file not found: $File"
    exit 1
}

$Item = Get-Item $File
$ActualHash = (Get-FileHash $File -Algorithm SHA256).Hash

Write-Host "Checkpoint verification"
Write-Host "-----------------------"
Write-Host "File:          $($Item.Name)"
Write-Host "Expected size: $ExpectedSize bytes"
Write-Host "Actual size:   $($Item.Length) bytes"
Write-Host "Expected hash: $ExpectedHash"
Write-Host "Actual hash:   $ActualHash"

$SizeMatch = $Item.Length -eq $ExpectedSize
$HashMatch = $ActualHash -eq $ExpectedHash

if ($SizeMatch -and $HashMatch) {
    Write-Host "PASS: Checkpoint matches the verified Hugging Face file."
    exit 0
}
else {
    if (-not $SizeMatch) {
        Write-Warning "File size does not match."
    }

    if (-not $HashMatch) {
        Write-Warning "SHA-256 does not match."
    }

    Write-Error "FAIL: Checkpoint verification failed."
    exit 1
}

[CmdletBinding()]
param(
    [switch]$IncludeDrafts
)

$ErrorActionPreference = "Stop"

$hugoCommand = Get-Command hugo -ErrorAction SilentlyContinue
if (-not $hugoCommand) {
    throw "Hugo is not available on PATH. Install Hugo before running verification."
}

$hugoArgs = @("--gc", "--minify")
if ($IncludeDrafts) {
    $hugoArgs += "--buildDrafts"
}

Write-Host "Using $(& hugo version)"
Write-Host "Running: hugo $($hugoArgs -join ' ')"

& hugo @hugoArgs
if ($LASTEXITCODE -ne 0) {
    throw "Hugo build failed with exit code $LASTEXITCODE."
}

$indexPath = Join-Path $PWD "public\index.html"
if (-not (Test-Path -LiteralPath $indexPath -PathType Leaf)) {
    throw "Hugo build completed without generating public\index.html."
}

Write-Host "Hugo verification completed successfully."

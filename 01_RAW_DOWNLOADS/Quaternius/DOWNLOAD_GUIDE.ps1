# Quaternius Pack Downloader
# Run this script to open the itch.io pages and download each pack (enter $0 at checkout)
# All packs are CC0 — commercial use, no attribution required

$packs = @(
  @{name="Downtown City MegaKit";       url="https://quaternius.itch.io/downtown-city-megakit";    dest="01_RAW_DOWNLOADS\Quaternius\downtown-city-megakit"},
  @{name="Stylized Nature MegaKit";     url="https://quaternius.itch.io/stylized-nature-megakit";  dest="01_RAW_DOWNLOADS\Quaternius\stylized-nature-megakit"},
  @{name="Textured LowPoly Trees";      url="https://quaternius.itch.io/textured-lowpoly-trees";   dest="01_RAW_DOWNLOADS\Quaternius\textured-lowpoly-trees"},
  @{name="LowPoly Modular Street";      url="https://quaternius.itch.io/lowpoly-modular-street";   dest="01_RAW_DOWNLOADS\Quaternius\lowpoly-modular-street"}
)

$base = Split-Path $MyInvocation.MyCommand.Path -Parent

Write-Host "=== Quaternius Pack Download Guide ===" -ForegroundColor Cyan
Write-Host "All packs are name-your-price on itch.io. Enter $0 to download free." -ForegroundColor Yellow
Write-Host ""

foreach ($p in $packs) {
  $destFull = Join-Path $base $p.dest
  New-Item -ItemType Directory -Force -Path $destFull | Out-Null
  Write-Host "Pack: $($p.name)" -ForegroundColor Green
  Write-Host "  1. Open: $($p.url)"
  Write-Host "  2. Click 'Download or claim'"
  Write-Host "  3. Enter payment: $0"
  Write-Host "  4. Download ZIP to: $destFull"
  Write-Host "  5. Extract ZIP contents into that folder"
  Write-Host ""
  
  # Try to open in default browser
  try { Start-Process $p.url } catch {}
  Start-Sleep -Seconds 2
}

Write-Host "After downloading, run: .\02_sort_quaternius_to_ready.ps1" -ForegroundColor Cyan

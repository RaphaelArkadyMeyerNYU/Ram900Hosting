<#
.SYNOPSIS
Export the current assembled Manim player for this website, without render caches.
.EXAMPLE
powershell -NoProfile -ExecutionPolicy Bypass -File .github/scripts/export-new-angle-slides.ps1 -PresentationDirectory "C:\path\to\SIAM MDS Slides 2"
#>
[CmdletBinding()]
param(
    [Parameter(Mandatory = $true)]
    [string]$PresentationDirectory
)

Set-StrictMode -Version Latest
$ErrorActionPreference = 'Stop'
$utf8 = [System.Text.UTF8Encoding]::new($false)
$repository = [IO.Path]::GetFullPath((Join-Path $PSScriptRoot '..\..'))
$destination = Join-Path $repository '_assets\NewAngleMDS25min'
$clipDestination = Join-Path $destination 'clips'
$source = (Resolve-Path -LiteralPath $PresentationDirectory).ProviderPath
$player = Join-Path $source 'player'
$manifestPath = Join-Path $player 'manifest.js'
$manifest = [IO.File]::ReadAllText($manifestPath, [Text.Encoding]::UTF8)
$match = [regex]::Match($manifest, '\A\s*window\.TALK\s*=\s*(\[.*\])\s*;?\s*\z', 'Singleline')
if (-not $match.Success) { throw 'The presentation manifest is not in the expected format.' }
$clips = ConvertFrom-Json -InputObject $match.Groups[1].Value
if ($clips.Count -eq 0) { throw 'The presentation has no clips. Build it first.' }

# Validate every input before changing the published copy.
$names = @{}
$inputs = foreach ($clip in $clips) {
    $clipMatch = [regex]::Match($clip.file, '\Aclips/([A-Za-z0-9_.-]+\.mp4)\?v=([0-9a-f]{10})\z')
    if (-not $clipMatch.Success) { throw "Unexpected clip path: $($clip.file)" }
    $name = $clipMatch.Groups[1].Value
    if ($names.ContainsKey($name)) { throw "Duplicate clip: $name" }
    $names[$name] = $true
    $path = Join-Path (Join-Path $player 'clips') $name
    $hash = (Get-FileHash -LiteralPath $path -Algorithm SHA256).Hash.ToLowerInvariant()
    if (-not $hash.StartsWith($clipMatch.Groups[2].Value)) { throw "Clip does not match the manifest: $name" }
    [pscustomobject]@{ Name = $name; Path = $path }
}
$html = [IO.File]::ReadAllText((Join-Path $player 'index.html'), [Text.Encoding]::UTF8)
$javascriptPath = Join-Path $player 'player.js'
$javascript = [IO.File]::ReadAllText($javascriptPath, [Text.Encoding]::UTF8)

# These are generated folders. Do not follow a junction or symlink when refreshing.
foreach ($folder in @($destination, $clipDestination)) {
    if (Test-Path -LiteralPath $folder) {
        $item = Get-Item -LiteralPath $folder -Force
        if (-not $item.PSIsContainer -or ($item.Attributes -band [IO.FileAttributes]::ReparsePoint)) {
            throw "Expected a normal directory: $folder"
        }
    }
}
[IO.Directory]::CreateDirectory($clipDestination) | Out-Null
foreach ($inputClip in $inputs) {
    Copy-Item -LiteralPath $inputClip.Path -Destination (Join-Path $clipDestination $inputClip.Name)
}
[IO.File]::WriteAllText((Join-Path $destination 'player.js'), $javascript, $utf8)

# Add mobile viewport support and content versions for the static website.
if (-not $html.Contains('name="viewport"')) {
    $html = $html.Replace('<meta charset="utf-8">', '<meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1">')
}
$manifestVersion = (Get-FileHash -LiteralPath $manifestPath -Algorithm SHA256).Hash.Substring(0, 10).ToLowerInvariant()
$playerVersion = (Get-FileHash -LiteralPath $javascriptPath -Algorithm SHA256).Hash.Substring(0, 10).ToLowerInvariant()
$html = $html.Replace('src="manifest.js"', ('src="manifest.js?v={0}"' -f $manifestVersion))
$html = $html.Replace('src="player.js"', ('src="player.js?v={0}"' -f $playerVersion))
[IO.File]::WriteAllText((Join-Path $destination 'manifest.js'), $manifest, $utf8)
[IO.File]::WriteAllText((Join-Path $destination 'index.html'), $html, $utf8)

# Remove only obsolete generated video files in this presentation's clips folder.
foreach ($old in Get-ChildItem -LiteralPath $clipDestination -File -Filter '*.mp4') {
    if (-not $names.ContainsKey($old.Name) -and $old.Name -match '^\d{3}-S\d{2}_[A-Za-z0-9_]+-[A-Za-z0-9_-]+\.mp4$') {
        Remove-Item -LiteralPath $old.FullName
    }
}
$slideCount = @($clips | Select-Object -ExpandProperty slide -Unique).Count
$readme = @"
Static export of A new angle on matrix-vector complexity.
$slideCount slides; $($clips.Count) animation clips, loaded one at a time.

Published URL: /assets/NewAngleMDS25min/
Franklin copies this _assets folder into the generated site's assets folder.
No Python, Manim, or server application is needed on the website.

To update: rebuild and assemble the source presentation, then run
powershell -NoProfile -ExecutionPolicy Bypass -File .github/scripts/export-new-angle-slides.ps1 -PresentationDirectory "C:\path\to\SIAM MDS Slides 2"
from the root of the website repository. Do not edit these generated files by hand.
"@
[IO.File]::WriteAllText((Join-Path $destination 'README.txt'), $readme + [Environment]::NewLine, $utf8)
$bytes = (Get-ChildItem -LiteralPath $destination -File -Recurse | Measure-Object -Property Length -Sum).Sum
Write-Output ("Exported {0} slides / {1} clips to {2} ({3:N2} MB)." -f $slideCount, $clips.Count, $destination, ($bytes / 1000000))

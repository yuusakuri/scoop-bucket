python3.exe -m pip install requests mutagen websockets git+https://github.com/animelover1984/youtube-dl

Get-Command -Name "pip.exe" |
Select-Object -ExpandProperty Source |
Split-Path -Parent |
Join-Path -ChildPath "youtube-dl.exe" |
Rename-Item -LiteralPath { $_ } -NewName "youtube-dl-animelover1984.exe"

Write-Host "The exe file name is youtube-dl-animelover1984.exe."

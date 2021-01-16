if (!(is_admin)) { error "Admin rights are required."; exit 1 
}
$uninstallFontFileRegex = (Get-ChildItem -LiteralPath $dir -Recurse -File |
    Where-Object Name -Match '\\.(otf|ttf)$' |
    Select-Object -ExpandProperty BaseName) -join '|'

Get-Fonts -WarningAction SilentlyContinue |
Where-Object { $_.File.Name -match $uninstallFontFileRegex } |
Select-Object -ExpandProperty Name |
ForEach-Object { PSWinGlue\Uninstall-Font -Name $_ -Scope System }
<# Get-Fonts -WarningAction SilentlyContinue |
Where-Object { $_.File.Name -match $uninstallFontFileRegex } |
Select-Object -ExpandProperty Name |
ForEach-Object { PSWinGlue\Uninstall-Font -Name $_ -Scope User } #>

if (!(is_admin)) { error "Admin rights are required."; exit 1
}
$paths = Get-ChildItem -LiteralPath $dir -Recurse -File |
Where-Object Name -Match '\\.(otf|ttf)$' |
Select-Object -ExpandProperty FullName
if ($paths -match '\\.otf$') {
    $paths = $paths | Where-Object { $_ -match '\\.otf$' }
}
$paths | ForEach-Object {
    PSWinGlue\Install-Font -Path $_ -Scope System -WarningAction SilentlyContinue -ErrorAction SilentlyContinue
}
<# $paths | ForEach-Object {
  PSWinGlue\Install-Font -Path $_ -Scope User -WarningAction SilentlyContinue -ErrorAction SilentlyContinue
} #>

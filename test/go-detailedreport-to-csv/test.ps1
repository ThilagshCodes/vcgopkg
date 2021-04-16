Copy-Item -Path "$PSScriptRoot\input" -Destination "$PSScriptRoot\temp" -Recurse
& "$PSScriptRoot\..\..\vcgopkg.exe" $PSScriptRoot\temp 20060102150405
$fsInput  = Get-ChildItem -Recurse -path $PSScriptRoot\temp
$fsOutput = Get-ChildItem -Recurse -path $PSScriptRoot\output
$c = Compare-Object -ReferenceObject $fsInput -DifferenceObject $fsOutput
Remove-Item "$PSScriptRoot\temp" -Recurse

if ($c -ne 0) {
    Write-Output $c
    exit 1
}
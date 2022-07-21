Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadlineOption -EditMode windows
Import-Module -Name Terminal-Icons

$env:PSModulePath=$env:PSModulePath + (":~/git/ChiaShell/Powershell/Modules")
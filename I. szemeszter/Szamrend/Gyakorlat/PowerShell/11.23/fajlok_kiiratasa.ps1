#Csak a fileoket irja ki a script
Get-ChildItem | Where-Object { $_.PSIsContainer -eq  $false} | ForEach-Object {
    Write-Output $_.Name
}
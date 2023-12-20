# 1. feladat - barkoba
Write-Output "Gondoltam egy szamra 1 es 20 kozott"
$szam=Get-Random -Minimum 1 -Maximum 20
[int]$tipp=Read-Host "Kerem a tippet"

while($szam -ne $tipp)
{
    if($szam -gt $tipp){
        Write-Host "Nagyobb szamra gondoltam"
    } else {
        Write-Host "Kisebb szamra gondoltam"
    }
    [int]$tipp=Read-Host "Kerem a kovetkezo tippet"
}
Write-Host "Kitalaltad a szamot!"
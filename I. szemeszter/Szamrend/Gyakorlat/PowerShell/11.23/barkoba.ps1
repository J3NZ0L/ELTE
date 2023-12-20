#barkobajatek
Write-Output "Gondoltam egy sz(ala)m(i)ra 1 es 20 kozott"
$szam=Get-Random -Minimum 1 -Maximum 20
[int]$tipp=Read-Host "Kerem a tippet"

while($szam -ne $tipp)
{
    if($szam -gt $tipp){
        Write-Host "Nagyobb sza(la)m(i)ra gondoltam"
    } else {
        Write-Host "Kisebb sza(la)m(i)ra gondoltam"
    }
    [int]$tipp=Read-Host "Kerem a tippet"
}
Write-Host "Megtalaltad a sza(la)mimat"
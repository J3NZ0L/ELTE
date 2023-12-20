#parameterek szamanak kiiratasa
$args.Length 
# elso es masodik parametert pedig adjuk ossze es szorozzuk ossze
$firstarg = [int]$args[0]
$secondarg = [int]$args[1]

$sum = $firstarg + $secondarg
$product = $firstarg * $secondarg

Write-Output "Osszeg: $sum"
Write-Output "Szorzat: $product"
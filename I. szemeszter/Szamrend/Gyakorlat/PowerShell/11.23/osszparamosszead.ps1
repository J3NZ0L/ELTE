if($args.Count -eq 0) {
    Write-Host "Legalabb egy parametere szukseges"
}else{
    $sum=0
    foreach ($arg in $args){
        $sum+=$arg
    }
    Write-Host "Az osszeg: $sum"
}
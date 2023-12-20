# 3. feladat lnko
    $a=[int](Read-Host "Kerem az A szamot: ")
    $b=[int](Read-Host "Kerem az B szamot: ")
    while ($a -ne $b){
        if ($a -lt $b){
            $b=$b-$a
        } else {
            $a=$a-$b
        }
    } 
    Write-Host $b

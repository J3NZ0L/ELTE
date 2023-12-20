$a=$args[0]
$b=$args[1]

for ($i=0; $i -lt $a; $i++){
    $s=""
    for ($j=0; $j -lt $b; $j++){
        $s=$s+"* "
    }
    Write-Host $s   
} 
$T=$a*$b
$K=2*$a+2*$b
Write-Host "T: $T K: $K"
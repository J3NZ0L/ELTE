for ($i=1; $i -le 10; $i++){
    for ($j=1; $j -le 10; $j++){
        $p=$i*$j
        if ($p -lt 10){
        Write-Host -NoNewline "$p  "
        } else {
        Write-Host -NoNewline "$p "
        }
    }
    Write-Host
}
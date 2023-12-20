#parameterkent megadott masodik szo kiiratasa
(Get-Content "ujteszt.txt") | ForEach-Object {
    $word = $_.Split(" ")
    Write-Output $word[1]
}
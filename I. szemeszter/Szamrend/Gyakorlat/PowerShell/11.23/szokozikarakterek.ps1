(Get-Content "ujteszt.txt") | ForEach-Object {
    $_.substring(1, 4) #azt csinalja hogy a string egy reszet ugymond kivagjuk, nullatol indexelunk szval megadjuk h melyik karaktertol indulunk (masodik), 4 et fogunk kiirni azaz 2-5. karakterig iratjuk ki

}
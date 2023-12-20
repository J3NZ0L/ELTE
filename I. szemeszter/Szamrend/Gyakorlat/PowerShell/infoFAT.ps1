# Blokkok "tarolasa" fajlba:
if (-not (Test-Path "FAT.dat")) {
    $chars = "HFS"
    $length = (Get-Random -Minimum 1 -Maximum 11)
    $file_content = ""
    for ($i = 0; $i -lt $length; $i++) {
        $char = $chars.Substring((Get-Random -Minimum 0 -Maximum $chars.Length), 1)
        $file_content += $char
    }
    $file_content | Out-File -FilePath "FAT.dat"
}

# Listazas:
if ($args[0] -eq "-lista") {
    Get-Content "FAT.dat"
}

# Szabad blokkok szamanak megjelenitese:
if ($args[0] -eq "-szabad") {
    $text = Get-Content "FAT.dat" 
    $free_blocks = ($text -split "S" | Measure-Object).Count - 1
    Write-Host $free_blocks
}

# Leghosszabb szabad blokksorozat:
if ($args[0] -eq "-max") {

    $text = Get-Content -Path "FAT.dat" -Raw
    $matches = [regex]::Matches($text, "S+")

    if ($matches.Count -gt 0) {
        $maxLength = ($matches | ForEach-Object { $_.Value.Length } | Measure-Object -Maximum).Maximum
        Write-Host $maxLength
    } else {
        Write-Host "0"
    }
}

# Foglalas
if ($args[0] -eq "-foglal") {
    $size = $args[1]
    $count = 0
    $file_content = Get-Content "FAT.dat"
    foreach ($block in $file_content.ToCharArray()) {
        if ($block -eq "S") {
            $count++
            if ($count -eq $size) {
                $charS = 'S'
                $charF = 'F'
                $Fstring = -join ($charF * $count)
                $Sstring = -join ($charS * $count)
                #$file_content = $file_content -replace $Sstring, $Fstring, 1
                $file_content = ($file_content -split $Sstring, 2) -join $Fstring
                $file_content | Out-File -FilePath "FAT.dat"
                Write-Output "blokksorozat lefoglalva"
                exit 0
            }
        }
        else {
            $count = 0
        }
    }
    Write-Output "nincs elegendo szabad hely"
}
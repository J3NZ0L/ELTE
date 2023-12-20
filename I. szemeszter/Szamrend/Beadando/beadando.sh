A megadott feladat alapján elkészíthetjük az `infoFAT.sh` shell szkriptet. Az alábbiakban található a szkript forráskódja:


#!/bin/bash  
# Ellenőrzi, hogy a FAT fájl létezik-e 
check_fat_file() {     
    if [ ! -f "$FAT_FILE" ]; then         
        echo "Hiba: A FAT fájl nem található."         
        exit 1     
    fi
}  
# Lista készítése 
list_fat() {     
    check_fat_file     
    cat "$FAT_FILE"
}  
# Szabad blokkok számának meghatározása
count_free_blocks() {
    check_fat_file     
    free_blocks=$(grep -o "S" "$FAT_FILE" | wc -l)
    echo "Szabad blokkok száma: $free_blocks"
} 
# Leghosszabb összefüggő szabad blokk sorozat meghatározása 
max_free_block() {     
    check_fat_file     
    max=0     
    current=0      
    while read -r line;
    do         
        if [ "$line" == "S" ]; then
            ((current++))             
        if [ "$current" -gt "$max" ]; then                 
        max=$current             
        fi         
        else             
        current=0         
        fi     
        done < "$FAT_FILE"      
        echo "A leghosszabb szabad blokk sorozat hossza: $max" 
        }  
# Blokk foglalása 
allocate_blocks() {
    check_fat_file     
    size=$1     
    blocks=$(grep -o "S" "$FAT_FILE" | wc -l)      
    if [ "$size" -le "$blocks" ]; then         
    sed -i "s/S/F/$size" "$FAT_FILE"         
    echo "Sikeresen foglalt $size blokkot."     
    else         echo "Nincs elegendő szabad blokk a foglaláshoz."
    fi }  
# Kapcsolók feldolgozása
case "$1" in     
-lista)         list_fat         ;;
-szabad)         count_free_blocks         ;;
-max)         max_free_block         ;;
-foglal)         
if [ $# -eq 2 ]; then             
allocate_blocks "$2"         
else             
echo "Hiba: A foglal parancs használata: ./infoFAT.sh -foglal <blokkok_száma>"
exit 1         
fi         ;;     *)
echo "Hiba: Ismeretlen kapcsoló."         exit 1         ;; esac`


A szkript használata a következőképpen történik:

1. `-lista`: Kilistázza a FAT fájl tartalmát. Példa: `./infoFAT.sh -lista`
    
2. `-szabad`: Megadja, hány szabad blokk van. Példa: `./infoFAT.sh -szabad`
    
3. `-max`: Megadja a leghosszabb összefüggő szabad blokksorozat hosszát. Példa: `./infoFAT.sh -max`
    
4. `-foglal <blokkok_száma>`: Foglal le a megadott méretű blokksorozatot, ha van elég hely. Példa: `./infoFAT.sh -foglal 5`
    

Fontos: A szkript működéséhez a `FAT.dat` fájlt a megfelelő helyen létre kell hozni és megfelelő tartalommal kell feltölteni, hogy a műveletek megfelelően végezhetők legyenek.
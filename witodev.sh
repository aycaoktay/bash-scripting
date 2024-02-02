#!/bin/bash

read -p "Yedekleme yapılacak dizin : " src_drc
if [ ! -d "$src_drc" ]; then
    echo "Hata: '$src_drc' bir dizin değil"
    exit 1
fi

read -p "Yedekleme dizini: " backup_drc
if [ ! -d "$backup_drc" ]; then
    echo "Hata: '$backup_drc' bir dizin değil"
    exit 1
fi

echo "Yedeklenecek dizin: $src_drc"

read -p "Kaç gün öncesine ait dosyaları silmek istersiniz?: " day_rm

# Yedekleme dizinini kontrol et, yoksa mkdir ile yeni bir dizin oluşturuyorum.
mkdir -p "$backup_drc" && echo "Yedekleme dizini: $backup_drc"

# Yedekleme ve tarih bilgisi işlemi için ;
for file in "$src_drc"/*; do
    if [ -f "$file" ]; then
        # Dosya adının yanına tarih ekliyorum
        backup_file="$backup_drc/$(basename "$file")_$(date '+%Y%m%d')"
        cp "$file" "$backup_file"
        echo "Yedekleme yapıldı: $backup_file"
    fi
done

# sileceğimiz dizin = backup_drc kullanıcının girdiği dizin
read -p "Belirtilen dosyalar silinsin mi? (Y/N)" confirmation
if [ "$confirmation" == "Y" ]; then
   find "$backup_drc" -type f -mtime +$day_rm -exec rm {} \;
   echo "Belirtilen tarihten önceki dosyalar silindi."
else
   echo "Silme işlemi iptal edildi."
   exit 1 
fi

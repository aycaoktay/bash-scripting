# Bash Scripting Yedekleme ve Silme İşlemleri

- 1. **Scripti Çalıştırma:** <br/>
Terminal veya komut istemcisinde script dosyasını çalıştırabilirsiniz.
 `bash witodev.sh`
- 2. **Bilgilerin Alınması** <br/>
Kullanıcıdan yedekleme yapılacak dizin (``src_drc``), yedekleme dizini (`backup_drc`), gün sayısı (`day_rm`), ve silme onayı (``confirmation``) gibi bilgiler alınır.
`read` komutu ile bu bilgileri aldık.
- 3. **Dizin kontrolleri** <br/>
Dizinlerin varlığı kontrol edilir, eğer dizin yoksa hata mesajı verilir ve script sonlanır.
 `if [ ! -d "$src_drc" ];`
 `if [ ! -d "$backup_drc" ];`
 Yedekleme dizinini kontrol ediyoruz yoksa `mkdir` komutu ile yeni bir dizin oluşturuyoruz.
- 4. **Yedekleme İşlemi** <br/>
Yedeklenen dosyaların isimlerine tarih eklenir `$(date '+%Y%m%d')`
- 5. **Silme işlemi için kullanıcıdan onay alma.** <br/>
 Onay kontrolü için yine `read` komutunu kullanıp;
`if [ "$confirmation" == "Y" ];` ile cevabı doğruluyoruz.

## Örnek Kullanım
- Yedekleme yapılacak dizin: /ayca/ankasoft
- Yedekleme dizini: /ayca/wit
- Kaç gün öncesine ait dosyaları silmek isersiniz? : 7
- Belirtilen dosyalar silinsin mi? (E/H): E

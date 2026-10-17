# 🏨 Otel Rezervasyon ve Konaklama Yönetim Sistemi

Bu proje, Karadeniz Teknik Üniversitesi - Veritabanı Yönetim Sistemleri dersi kapsamında geliştirilmiş kapsamlı bir otel otomasyon ve rezervasyon sistemidir. Proje; ilişkisel veritabanı tasarımı, gelişmiş SQL nesneleri (Trigger, Stored Procedure, View, Transaction), backend API katmanı ve kullanıcı arayüzünü içermektedir.

---

## 🚀 Proje Hakkı ve Amaç
Bir otelin oda yönetimi, misafir kayıtları, rezervasyon süreçleri, check-in/check-out işlemleri, ek hizmetler, ödemeler ve personel yönetimini otomatikleştirmek; aynı zamanda veritabanı seviyesinde iş kurallarını (çakışan tarih kontrolü vb.) güvenli bir şekilde sağlamak amacıyla geliştirilmiştir.

---

## 🛠️ Kullanılan Teknolojiler
* **Veritabanı:** MySQL / PostgreSQL / MSSQL
* **Backend:** [Seçtiğin teknolojiye göre: Flask / Spring Boot / .NET]
* **Frontend:** [HTML/CSS/JS veya ilgili arayüz teknolojisi]
* **Test Araçları:** Postman / Swagger

---

## 📂 Veritabanı Mimarisi ve Özellikleri
Proje gereksinimlerine uygun olarak aşağıdaki veritabanı nesneleri ve yapılar kurgulanmıştır:

### 1. Temel Tablolar (3NF Uyumlu)
* `OdaTipi`: Oda tipleri, kapasiteler ve temel fiyatlar.
* `Oda`: Oda numaraları, kat bilgileri ve güncel durumlar (boş, dolu, temizlikte vb.).
* `SezonFiyati`: Sezonluk dönemsel fiyatlandırmalar.
* `Misafir`: Müşteri bilgileri.
* `Kullanici` & `Personel`: Rol bazlı yetkilendirme (Misafir, Resepsiyon, Yönetici) ve personel takibi.
* `Rezervasyon` & `Konaklama`: Tarih aralığı ve konaklama süreçleri.
* `EkHizmet` & `KonaklamaHizmeti`: Oda servisi, spa, kahvaltı gibi ek harcamalar.
* `Odeme`: Finansal işlemler.
* `TemizlikKaydi` & `IslemLog`: Sistem loglama ve operasyonel takip.

### 2. Gelişmiş Veritabanı Nesneleri
* **Trigger (Tetetikleyiciler):**
  1. Çakışan tarihlerde aynı odaya rezervasyon yapılmasını engelleyen mekanizma.
  2. Check-in/Check-out durumlarına göre oda durumunu otomatik güncelleyen yapı.
  3. Kritik tablolardaki değişiklikleri `IslemLog` tablosuna kaydeden loglama mekanizması.
* **Stored Procedure (Saklı Prosedürler):**
  * Tarih aralığı ve oda tipine göre boş oda listeleme.
  * Sezon fiyatları ve ek hizmetleri hesaba katarak toplam konaklama tutarı hesaplama.
  * Aylık doluluk oranı ve gelir raporu üretme.
* **View (Görünümler):**
  * Günlük giriş-çıkış yapacak misafirler listesi.
  * Oda bazlı güncel durum ve son temizlik tarihi takip görünümü.
* **Transaction (İşlem Yönetimi):**
  * Check-out sürecinin bütünlüğünü koruyan (`COMMIT` / `ROLLBACK`) güvenli işlem blokları.

---

## ⚙️ Kurulum ve Çalıştırma
Projeyi yerel ortamınızda (local) çalıştırmak için izlenecek adımlar:

1. **Veritabanını Kurun:**
   * MySQL üzerinde yeni bir veritabanı oluşturun.
   * `database/` klasöründeki SQL betiklerini sırasıyla çalıştırarak tabloları, trigger'ları ve örnek verileri (20+ oda, 50+ misafir, 200+ rezervasyon) yükleyin.

2. **Backend'i Başlatın:**
   * İlgili proje dizinine gidin ve bağımlılıkları yükleyin.
   * Konfigürasyon dosyasından veritabanı bağlantı ayarlarınızı (`host`, `user`, `password`) güncelleyin ve sunucuyu ayağa kaldırın.

3. **Frontend / Arayüzü Açın:**
   * Uygulama arayüzüne tarayıcınız üzerinden erişim sağlayın.

---
-- daha sonra düzeltilebilir (khoder- ilk değişiklik 10/17/2026)
## 👥 Geliştiriciler
* [Adınız Soyadınız] - [Öğrenci Numaranız]
* [Grup Arkadaşınızın Adı] - [Öğrenci Numaranız]

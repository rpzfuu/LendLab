# LendLab

**Bahasa:** **ID** | [EN](README_en.md)

LendLab adalah aplikasi Flutter untuk mencatat pinjaman uang dan barang. Aplikasi ini membantu pengguna mencatat siapa yang meminjam, apa yang dipinjam, kapan pinjaman dibuat, dan apakah pinjaman sudah dikembalikan.

Aplikasi ini awalnya dibuat sebagai pencatat pinjaman ringan dengan model data khusus yang terhubung ke Supabase.

## Fitur

- Daftar dan masuk dengan sistem akun sederhana.
- Tambah pinjaman uang.
- Tambah pinjaman barang.
- Lihat daftar pinjaman aktif.
- Cari data pinjaman.
- Edit detail pinjaman.
- Tandai pinjaman sebagai selesai.
- Lihat riwayat pinjaman yang sudah selesai.
- Tampilkan status loading dan pesan error untuk operasi Supabase.

## Layar

Aplikasi ini mencakup:

- Splash screen
- Layar login dan signup
- Layar beranda
- Pilihan jenis pinjaman
- Form tambah pinjaman uang
- Form tambah pinjaman barang
- Layar detail dan edit
- Layar riwayat
- Layar profil

## Tech Stack

- Flutter
- Dart
- GetX
- Supabase
- PostgreSQL
- flutter_dotenv

## Kebutuhan

- Flutter SDK
- Android SDK atau Android Studio
- Project Supabase
- Perangkat Android atau emulator

Project ini sudah divalidasi dengan:

- Flutter `3.38.9`
- Dart `3.10.8`
- Java `21`
- Gradle `8.14`
- Android Gradle Plugin `8.11.1`
- Kotlin `2.2.20`

## Konfigurasi

Buat file `.env` di root project:

```env
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-supabase-anon-key
```

Template tersedia di [.env.example](.env.example).

## Database

LendLab menggunakan dua tabel publik Supabase:

- `public."User"`
- `public."Pinjaman"`

Script restore [supabase_lendlab_restore.sql](supabase_lendlab_restore.sql) membuat ulang tabel aplikasi, seed data, grants, sequences, dan entri realtime publication.

Script ini dirancang untuk Supabase SQL Editor dan sengaja tidak menyertakan object cluster yang dikelola Supabase, seperti roles, `auth`, `storage`, dan setup realtime internal.

## Cara Menjalankan

Install dependency:

```powershell
flutter pub get
```

Jalankan aplikasi:

```powershell
flutter run
```

Build APK debug:

```powershell
flutter build apk --debug
```

Build APK release:

```powershell
flutter build apk --release
```

Output APK release:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## Validasi

```powershell
flutter analyze
flutter build apk --debug
```

Saat ini belum ada direktori `test`, jadi automated test belum disertakan.

## Template Release Notes

Format GitHub release yang disarankan:

- Tag: `v0.1.0`
- Target: `main`
- Title: `LendLab v0.1.0`

```markdown
## LendLab v0.1.0

Rilis awal LendLab, aplikasi Flutter untuk mencatat pinjaman uang dan barang.

### Highlights
- Pencatatan pinjaman uang dan barang.
- Daftar pinjaman aktif dan riwayat pinjaman selesai.
- Penyimpanan data dengan Supabase.
- Feedback loading dan error untuk operasi data.
- Konfigurasi build Android diperbarui untuk tooling Flutter modern.

### Build
- Flutter 3.38.9
- Android Gradle Plugin 8.11.1
- Gradle 8.14
- Kotlin 2.2.20
```

## Catatan Keamanan

Project ini masih mempertahankan arsitektur awal sebagai learning project:

- Autentikasi menggunakan tabel custom `public."User"`.
- Password disimpan sebagai plain text.
- Tabel publik dapat diakses melalui anon key.
- RLS dinonaktifkan di script restore agar perilaku aplikasi saat ini tetap sama.

Untuk penggunaan production, migrasikan autentikasi ke Supabase Auth, hash password atau hapus penyimpanan password custom sepenuhnya, aktifkan RLS, dan tambahkan policy dengan prinsip least privilege.

## Catatan Maintenance

- `supabase_flutter` masih menggunakan versi `1.x`; upgrade ke `2.x` membutuhkan migrasi API.
- `dependency_overrides` digunakan untuk `sign_in_with_apple` agar project bisa build di versi Flutter yang lebih baru sambil tetap memakai `supabase_flutter 1.x`.
- `kotlin.incremental=false` diset untuk menghindari masalah cache incremental Kotlin di Windows saat file source plugin berada di drive yang berbeda dari project.

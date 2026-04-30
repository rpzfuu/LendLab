# LendLab

LendLab adalah aplikasi Flutter sederhana untuk mencatat peminjaman uang dan barang. Pengguna bisa membuat akun, login, menambahkan catatan peminjaman, memperbarui detail, menandai pinjaman sebagai selesai, dan melihat riwayat.

## Fitur

- Login dan registrasi berbasis tabel custom `public."User"` di Supabase.
- Tambah peminjaman uang atau barang.
- Lihat daftar peminjaman aktif.
- Ubah detail peminjaman.
- Tandai peminjaman sebagai selesai.
- Lihat riwayat peminjaman yang sudah selesai.
- Feedback loading dan SnackBar untuk proses Supabase.

## Tech Stack

- Flutter
- GetX
- Supabase Flutter `1.x`
- flutter_dotenv
- PostgreSQL di Supabase

## Persiapan

Pastikan sudah tersedia:

- Flutter SDK
- Android Studio atau Android SDK
- Device/emulator Android
- Project Supabase aktif

Project ini sudah diuji dengan Flutter `3.38.9` dan Java `21` bawaan Android Studio. Konfigurasi Android memakai Gradle `8.14`, Android Gradle Plugin `8.11.1`, Kotlin `2.2.20`, dan target Java `17`.

## Setup Environment

1. Copy template env:

```powershell
Copy-Item .env.example .env
```

2. Isi `.env` dengan credential Supabase:

```env
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-supabase-anon-key
```

File `.env` sudah masuk `.gitignore`, jadi tidak ikut ter-commit.

## Restore Database Supabase

Untuk membuat ulang tabel dan data app, buka Supabase Dashboard lalu masuk ke:

`SQL Editor` > paste isi [supabase_lendlab_restore.sql](supabase_lendlab_restore.sql) > `Run`

Script tersebut hanya membuat ulang tabel yang dipakai app:

- `public."User"`
- `public."Pinjaman"`

Script juga mengisi data lama, reset sequence, memberi grant ke `anon`, `authenticated`, dan `service_role`, serta menonaktifkan RLS agar cocok dengan app saat ini yang masih memakai anon key langsung.

Jangan paste dump cluster PostgreSQL penuh ke SQL Editor Supabase. Bagian seperti `CREATE ROLE`, `\connect`, schema `auth/storage/realtime`, dan `COPY FROM stdin` tidak cocok untuk Supabase managed dashboard.

## Install Dependency

```powershell
flutter pub get
```

## Jalankan App

Lihat device yang tersedia:

```powershell
flutter devices
```

Jalankan ke device Android:

```powershell
flutter run
```

Build APK debug:

```powershell
flutter build apk --debug
```

Output APK ada di:

```text
build/app/outputs/flutter-apk/app-debug.apk
```

## Validasi

```powershell
flutter analyze
flutter build apk --debug
```

Catatan: project belum memiliki folder `test`, jadi `flutter test` akan gagal dengan pesan `Test directory "test" not found`.

## Release GitHub

Untuk membuat GitHub Release, gunakan format berikut:

- Tag: `v0.1.0`
- Target: `main`
- Release title: `LendLab v0.1.0`

Contoh release notes:

```markdown
## LendLab v0.1.0

Release awal LendLab, aplikasi Flutter untuk mencatat peminjaman uang dan barang.

### Perubahan utama
- Menambahkan konfigurasi Supabase via `.env`.
- Menambahkan restore database Supabase lewat `supabase_lendlab_restore.sql`.
- Memperbaiki navigasi tombol Tambah.
- Menambahkan loading state dan SnackBar untuk proses tambah, update, dan selesai peminjaman.
- Memperbaiki label aksi dari Hapus menjadi Selesaikan.
- Menambahkan fallback nama user.
- Memperbarui konfigurasi Android agar kompatibel dengan Flutter terbaru.

### Build
- Flutter 3.38.9
- Android Gradle Plugin 8.11.1
- Gradle 8.14
- Kotlin 2.2.20

### Catatan
Database Supabase perlu di-restore menggunakan `supabase_lendlab_restore.sql` sebelum app digunakan.
```

Build APK release sebelum upload:

```powershell
flutter build apk --release
```

Upload file berikut ke bagian release assets:

```text
build/app/outputs/flutter-apk/app-release.apk
```

Jika tag `v0.1.0` sudah pernah dipakai, naikkan versi menjadi `v0.1.1`.

## Catatan Maintenance

- `supabase_flutter` masih versi `1.x`. Upgrade ke `2.x` perlu penyesuaian API, jadi belum dilakukan.
- `dependency_overrides` untuk `sign_in_with_apple` dipakai agar build Android kompatibel dengan Flutter baru, karena `supabase_flutter 1.x` masih menarik constraint plugin lama.
- Sistem login masih memakai tabel custom dan password plaintext. Untuk production, pindahkan ke Supabase Auth bawaan.
- RLS sengaja dimatikan untuk tabel `User` dan `Pinjaman` agar app lama tetap berjalan dengan anon key. Untuk production, aktifkan RLS dan buat policy yang benar.

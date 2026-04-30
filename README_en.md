# LendLab

**Language:** [ID](README.md) | **EN**

LendLab is a Flutter app for tracking borrowed money and items. It helps users record who borrowed something, what was borrowed, when it was borrowed, and whether it has been returned.

The app was originally built as a lightweight lending tracker with a custom Supabase-backed data model.

## Features

- Register and sign in with a simple account system.
- Add money loans.
- Add item loans.
- View active borrow records.
- Search borrow records.
- Edit borrow details.
- Mark borrow records as completed.
- View completed borrow history.
- Loading and error feedback for Supabase operations.

## Screens

The app includes:

- Splash screen
- Login and signup screens
- Home screen
- Add loan type selection
- Add money loan form
- Add item loan form
- Detail and edit screens
- History screen
- Profile screen

## Tech Stack

- Flutter
- Dart
- GetX
- Supabase
- PostgreSQL
- flutter_dotenv

## Requirements

- Flutter SDK
- Android SDK or Android Studio
- Supabase project
- Android device or emulator

This project has been validated with:

- Flutter `3.38.9`
- Dart `3.10.8`
- Java `21`
- Gradle `8.14`
- Android Gradle Plugin `8.11.1`
- Kotlin `2.2.20`

## Configuration

Create a `.env` file in the project root:

```env
SUPABASE_URL=https://your-project.supabase.co
SUPABASE_ANON_KEY=your-supabase-anon-key
```

A template is available in [.env.example](.env.example).

## Database

LendLab uses two public Supabase tables:

- `public."User"`
- `public."Pinjaman"`

The restore script [supabase_lendlab_restore.sql](supabase_lendlab_restore.sql) recreates the app tables, seed data, grants, sequences, and realtime publication entries.

It is designed for Supabase SQL Editor and intentionally excludes Supabase-managed cluster objects such as roles, `auth`, `storage`, and internal realtime setup.

## Getting Started

Install dependencies:

```powershell
flutter pub get
```

Run the app:

```powershell
flutter run
```

Build a debug APK:

```powershell
flutter build apk --debug
```

Build a release APK:

```powershell
flutter build apk --release
```

Release APK output:

```text
build/app/outputs/flutter-apk/app-release.apk
```

## Validation

```powershell
flutter analyze
flutter build apk --debug
```

There is currently no `test` directory, so automated tests are not included yet.

## Release Notes Template

Suggested GitHub release format:

- Tag: `v0.1.0`
- Target: `main`
- Title: `LendLab v0.1.0`

```markdown
## LendLab v0.1.0

Initial release of LendLab, a Flutter app for tracking borrowed money and items.

### Highlights
- Money and item loan tracking.
- Active loan list and completed loan history.
- Supabase-backed persistence.
- Loading and error feedback for data operations.
- Android build configuration updated for modern Flutter tooling.

### Build
- Flutter 3.38.9
- Android Gradle Plugin 8.11.1
- Gradle 8.14
- Kotlin 2.2.20
```

## Security Notes

This project keeps the original learning-project architecture:

- Authentication uses a custom `public."User"` table.
- Passwords are stored as plain text.
- Public tables are accessible through the anon key.
- RLS is disabled in the restore script to preserve the current app behavior.

For production use, migrate authentication to Supabase Auth, hash passwords or remove custom password storage entirely, enable RLS, and add least-privilege policies.

## Maintenance Notes

- `supabase_flutter` is still on `1.x`; upgrading to `2.x` requires API migration.
- `dependency_overrides` is used for `sign_in_with_apple` so the project can build on newer Flutter versions while still using `supabase_flutter 1.x`.
- `kotlin.incremental=false` is set to avoid Kotlin incremental cache issues on Windows when plugin source files live on a different drive from the project.

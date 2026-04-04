## 0.1.2

- **Fixed** generated `build.gradle.kts` failing to compile with Kotlin DSL errors.
  - Replaced Groovy syntax (`def`, `new Properties()`, single-quoted strings, `withReader`, `toInteger()`) with valid Kotlin DSL (`val`, `Properties()`, double-quoted strings, `.reader().use {}`, `.toInt()`).
  - Fixed deprecated `kotlinOptions` → `kotlin { compilerOptions {} }` block.
  - Fixed `Unresolved reference: it` in signing config by using explicit named lambda parameter.
  - Added required `import java.util.Properties` and `import java.io.FileInputStream`.

## 0.1.1

- Added built-in internationalization (i18n) support via **slang**.
  - Projects are scaffolded with `fr` (base) and `en` locale JSON files.
  - `build.yaml` is generated with slang configuration.
  - Translations are auto-generated after `relax create` via `dart run slang` + `build_runner`.
- Automatic `flutter pub get` and code generation run at the end of `relax create`.
- Patched iOS `Info.plist` with supported locales during project creation.
- Improved generated `README.md` with flavor run commands and translation regeneration instructions.
- Removed sample `product` and `user` modules from the example project.
- Removed redundant `flutter pub get` from post-create instructions (now runs automatically).

## 0.1.0

- Initial release.
- `relax create` — scaffold Flutter projects with Bloc, Provider, Riverpod, or GetX.
- `relax generate feature` — add feature modules with auto-detected architecture.
- `relax generate module` — add domain/data modules with RelaxORM integration.
- `relax generate model` — add standalone ORM model classes with `@RelaxTable`.
- `relax doctor` — check Dart, Flutter, and project environment.
- Automatic `build_runner` execution after module and model generation.
- Material 3 theming with customizable color palette and font.
- Android flavor configuration (development, staging, production).
- Environment package generation via `env_builder`.

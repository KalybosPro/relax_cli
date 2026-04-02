# relax_cli

A CLI tool to generate Flutter projects with clean architecture, ready to run.

Similar to [Very Good CLI](https://github.com/VeryGoodOpenSource/very_good_cli), relax scaffolds a complete Flutter project with the state management architecture of your choice.

## Installation

```bash
# From pub.dev (when published)
dart pub global activate relax_cli

# From source
dart pub global activate --source path .
```

## Commands

### `relax create` — Create a new project

```bash
relax create my_app                    # interactive architecture prompt
relax create my_app -a bloc            # direct mode
relax create my_app --architecture riverpod

# Customization options
relax create my_app -a bloc \
  --description "My awesome app" \
  --primary-color 1565C0 \
  --font Poppins
```

| Option | Default | Description |
|--------|---------|-------------|
| `-a, --architecture` | *(prompt)* | `bloc`, `provider`, `riverpod`, `getx` |
| `-d, --description` | *"A Flutter project..."* | pubspec.yaml description |
| `--primary-color` | `6750A4` | Hex seed color for Material 3 palette |
| `--font` | `Roboto` | `Roboto`, `Inter`, `Poppins`, `Lato`, `Montserrat` |

### `relax generate feature` — Add a feature module

```bash
relax generate feature settings        # auto-detects architecture
relax generate feature cart -a provider # override architecture
relax g feature profile                # shorthand alias
```

### `relax generate module` — Add a domain/data module

```bash
relax generate module product          # generates in lib/modules/
relax generate module user -o core/domain  # custom output directory
relax g module order                   # shorthand alias
```

### `relax doctor` — Check your environment

```bash
relax doctor
```

```
relax doctor
v0.1.0

  [+] Dart SDK — 3.11.0
  [+] Flutter SDK — 3.29.0
  [+] Flutter project — detected
```

### Other commands

```bash
relax --help          # show help
relax --version       # show version
relax generate -h     # show generate subcommands
```

## Supported architectures

| Architecture | `create` | `generate feature` | State management |
|-------------|----------|-------------------|------------------|
| **Bloc**    | yes | yes | `flutter_bloc`, `equatable` |
| **Provider**| yes | yes | `provider`, `ChangeNotifier` |
| **Riverpod**| yes | yes | `flutter_riverpod`, `Notifier` |
| **GetX**    | yes | yes | `get`, `GetxController`, `Obx` |

## Generated project structure (Bloc example)

```
my_app/
├── lib/
│   ├── main.dart
│   ├── app/
│   │   └── view/app.dart               # MaterialApp + theme
│   ├── core/
│   │   └── theme/
│   │       ├── app_colors.dart          # Material 3 color palette
│   │       ├── app_theme.dart           # Light & dark ThemeData
│   │       └── app_typography.dart      # M3 type scale
│   └── features/
│       └── home/
│           ├── bloc/                    # Bloc, Events, States
│           └── view/                    # Page & View
├── test/
├── pubspec.yaml
└── analysis_options.yaml
```

## Generated feature structure

```bash
relax g feature settings
```

```
lib/features/settings/
├── settings.dart                        # barrel
├── bloc/                                # (or notifiers/, providers/, controllers/)
│   ├── settings_bloc.dart
│   ├── settings_event.dart
│   └── settings_state.dart
└── view/
    ├── settings_page.dart               # Provider wrapper
    └── settings_view.dart               # UI
```

## Generated module structure

```bash
relax g module product
```

```
lib/modules/product/
├── product.dart                         # barrel
├── models/product.dart                  # immutable model
├── repositories/
│   ├── product_repository.dart          # abstract interface
│   └── product_repository_impl.dart     # implementation
└── data_sources/
    └── product_data_source.dart         # data access layer
```

## What you get out of the box

- **Material 3** theme with light/dark mode and customizable color palette
- **Feature-based** architecture with barrel files
- **Sealed classes** for events and states (Dart 3+)
- **Clean Architecture** modules with repository pattern
- **Auto-detection** of your project's architecture for `generate feature`
- Ready-to-run project with a Home feature example

## Development

```bash
dart test                  # run tests
dart test --concurrency=1  # sequential (tests use Directory.current)
dart analyze               # static analysis
dart run bin/relax.dart create my_app -a bloc   # run locally
dart compile exe bin/relax.dart -o relax         # native binary
```

## License

MIT

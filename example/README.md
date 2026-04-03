# Example

A Flutter project generated with [relax CLI](https://github.com/relax-cli).

## Getting Started

```bash
flutter pub get
flutter run
```

## Architecture

This project uses **Bloc** for state management.

```
lib/
├── app/              → Application root (MaterialApp)
├── core/             → Theme, colors, typography, constants
└── features/         → Feature modules (home, ...)
    └── <feature>/
        ├── bloc/     → Bloc, Events, States
        └── view/     → Pages & Widgets
```

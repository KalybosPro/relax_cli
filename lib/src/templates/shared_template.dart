import 'package:mason/mason.dart';

/// Shared template content reused across all architecture templates.
abstract final class SharedTemplate {
  /// Prefixes a relative path with the mustache project directory.
  static String p(String path) => '{{project_name.snakeCase()}}/$path';

  /// Returns the common [TemplateFile] list (analysis_options, core/theme, env).
  static List<TemplateFile> coreFiles() => [
        TemplateFile(p('analysis_options.yaml'), analysisOptions),
        TemplateFile(p('lib/core/core.dart'), coreBarrel),
        TemplateFile(p('lib/core/theme/app_theme.dart'), appTheme),
        TemplateFile(p('lib/core/theme/app_colors.dart'), appColors),
        TemplateFile(p('lib/core/theme/app_typography.dart'), appTypography),
        // ── DI ──────────────────────────────────────────────────
        TemplateFile(p('lib/core/di/di.dart'), diSetup),
        // ── Env / Flavor ────────────────────────────────────────
        TemplateFile(p('.env.development'), envDevelopment),
        TemplateFile(p('.env.staging'), envStaging),
        TemplateFile(p('.env.production'), envProduction),
        // ── VS Code ─────────────────────────────────────────────
        TemplateFile(p('.vscode/launch.json'), vscodeLaunchJson),
      ];

  // ─── Analysis options ──────────────────────────────────────────

  static const analysisOptions = '''
include: package:flutter_lints/flutter.yaml

linter:
  rules:
    prefer_const_constructors: true
    prefer_const_declarations: true
    avoid_print: true
''';

  // ─── README helper ─────────────────────────────────────────────

  static String readme(String archName, String featureDir) => '''
# {{project_name.titleCase()}}

A Flutter project generated with [relax CLI](https://github.com/relax-cli).

## Getting Started

```bash
flutter pub get
flutter run
```

## Architecture

This project uses **$archName** for state management.

```
lib/
├── app/              → Application root (MaterialApp)
├── core/             → Theme, colors, typography, constants
└── features/         → Feature modules (home, ...)
    └── <feature>/
        ├── $featureDir
        └── view/     → Pages & Widgets
```
''';

  // ─── App barrel ────────────────────────────────────────────────

  static const appBarrel = '''
export 'view/app.dart';
''';

  // ─── App test ──────────────────────────────────────────────────

  static const appTest = '''
import 'package:flutter_test/flutter_test.dart';

import 'package:{{project_name.snakeCase()}}/app/app.dart';

void main() {
  testWidgets('App renders HomePage', (tester) async {
    await tester.pumpWidget(const App());
    expect(find.text('{{project_name.titleCase()}}'), findsOneWidget);
  });
}
''';

  // ─── Core barrel ───────────────────────────────────────────────

  static const coreBarrel = '''
export 'di/di.dart';
export 'theme/app_colors.dart';
export 'theme/app_theme.dart';
export 'theme/app_typography.dart';
''';

  // ─── Theme ─────────────────────────────────────────────────────

  static const appColors = '''
import 'package:flutter/material.dart';

/// Central color palette for the application.
///
/// Change [seed] to update the entire Material 3 color scheme.
/// Add custom overrides below as needed.
abstract final class AppColors {
  /// Primary seed color — the entire M3 palette derives from this.
  static const seed = Color(0xFF{{primary_color}});

  // ── Custom overrides (optional) ──────────────────────────────
  // Add project-specific colors here, for example:
  // static const success = Color(0xFF4CAF50);
  // static const warning = Color(0xFFFFC107);
}
''';

  static const appTheme = '''
import 'package:flutter/material.dart';

import 'app_colors.dart';
import 'app_typography.dart';

/// Application theme data (light & dark).
///
/// Uses [ColorScheme.fromSeed] so the entire palette is derived
/// from a single seed color defined in [AppColors.seed].
abstract final class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.seed,
        ),
        textTheme: AppTypography.textTheme,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      );

  static ThemeData get dark => ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.seed,
          brightness: Brightness.dark,
        ),
        textTheme: AppTypography.textTheme,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 0,
        ),
      );
}
''';

  static const appTypography = '''
import 'package:flutter/material.dart';

/// Application text styles.
///
/// Based on Material 3 type scale.
/// To use a Google Font, add `google_fonts` to pubspec.yaml
/// and replace the fontFamily references.
abstract final class AppTypography {
  static const _fontFamily = '{{font_family}}';

  static const textTheme = TextTheme(
    displayLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 57,
      fontWeight: FontWeight.w400,
      letterSpacing: -0.25,
      height: 1.12,
    ),
    displayMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 45,
      fontWeight: FontWeight.w400,
      height: 1.16,
    ),
    displaySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 36,
      fontWeight: FontWeight.w400,
      height: 1.22,
    ),
    headlineLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 32,
      fontWeight: FontWeight.w400,
      height: 1.25,
    ),
    headlineMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 28,
      fontWeight: FontWeight.w400,
      height: 1.29,
    ),
    headlineSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 24,
      fontWeight: FontWeight.w400,
      height: 1.33,
    ),
    titleLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 22,
      fontWeight: FontWeight.w500,
      height: 1.27,
    ),
    titleMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.15,
      height: 1.50,
    ),
    titleSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
    ),
    bodyLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 16,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      height: 1.50,
    ),
    bodyMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.25,
      height: 1.43,
    ),
    bodySmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.4,
      height: 1.33,
    ),
    labelLarge: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 14,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.1,
      height: 1.43,
    ),
    labelMedium: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.33,
    ),
    labelSmall: TextStyle(
      fontFamily: _fontFamily,
      fontSize: 11,
      fontWeight: FontWeight.w500,
      letterSpacing: 0.5,
      height: 1.45,
    ),
  );
}
''';

  // ─── Env files ─────────────────────────────────────────────────

  static const envDevelopment = '''
APP_NAME={{project_name.titleCase()}} Dev
APP_SUFFIX=.dev
BASE_URL=http://localhost:8080
''';

  static const envStaging = '''
APP_NAME={{project_name.titleCase()}} Stg
APP_SUFFIX=.stg
BASE_URL=https://staging.api.example.com
''';

  static const envProduction = '''
APP_NAME={{project_name.titleCase()}}
APP_SUFFIX=
BASE_URL=https://api.example.com
''';

  // ─── DI setup (get_it) ─────────────────────────────────────────

  static const diSetup = '''
import 'package:env/env.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setUpRegister(EnvValue env) {
  getIt.registerSingleton<EnvValue>(env);

  // Register your repositories and services here, for example:
  // getIt.registerLazySingleton<AuthRepository>(
  //   () => AuthRepositoryImpl(env: env),
  // );
}
''';

  // ─── Flavor entry points ──────────────────────────────────────

  static const mainDevelopment = '''
import 'package:{{project_name.snakeCase()}}/app/app.dart';
import 'package:{{project_name.snakeCase()}}/bootstrap.dart';
import 'package:env/env.dart';

void main() {
  bootstrap(() => const App(), env: AppFlavor.development().getEnv);
}
''';

  static const mainStaging = '''
import 'package:{{project_name.snakeCase()}}/app/app.dart';
import 'package:{{project_name.snakeCase()}}/bootstrap.dart';
import 'package:env/env.dart';

void main() {
  bootstrap(() => const App(), env: AppFlavor.staging().getEnv);
}
''';

  static const mainProduction = '''
import 'package:{{project_name.snakeCase()}}/app/app.dart';
import 'package:{{project_name.snakeCase()}}/bootstrap.dart';
import 'package:env/env.dart';

void main() {
  bootstrap(() => const App(), env: AppFlavor.production().getEnv);
}
''';

  // ─── Bootstrap (Bloc — default) ───────────────────────────────

  static const bootstrap = '''
import 'dart:async';
import 'dart:developer';

import 'package:env/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/di/di.dart' as di;

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(\${bloc.runtimeType}, \$change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(\${bloc.runtimeType}, \$error, \$stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(
  Widget Function() builder, {
  required EnvValue env,
}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  Bloc.observer = const AppBlocObserver();

  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();

    di.setUpRegister(env);

    runApp(builder());
  }, (error, stack) {
    log(error.toString(), stackTrace: stack);
  });
}
''';

  // ─── Bootstrap (Provider) ─────────────────────────────────────

  static const bootstrapProvider = '''
import 'dart:async';
import 'dart:developer';

import 'package:env/env.dart';
import 'package:flutter/material.dart';

import 'core/di/di.dart' as di;

Future<void> bootstrap(
  Widget Function() builder, {
  required EnvValue env,
}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();

    di.setUpRegister(env);

    runApp(builder());
  }, (error, stack) {
    log(error.toString(), stackTrace: stack);
  });
}
''';

  // ─── Bootstrap (Riverpod) ─────────────────────────────────────

  static const bootstrapRiverpod = '''
import 'dart:async';
import 'dart:developer';

import 'package:env/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/di/di.dart' as di;

Future<void> bootstrap(
  Widget Function() builder, {
  required EnvValue env,
}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();

    di.setUpRegister(env);

    runApp(ProviderScope(child: builder()));
  }, (error, stack) {
    log(error.toString(), stackTrace: stack);
  });
}
''';

  // ─── Bootstrap (GetX) ─────────────────────────────────────────

  static const bootstrapGetx = '''
import 'dart:async';
import 'dart:developer';

import 'package:env/env.dart';
import 'package:flutter/material.dart';

import 'core/di/di.dart' as di;

Future<void> bootstrap(
  Widget Function() builder, {
  required EnvValue env,
}) async {
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };

  runZonedGuarded(() {
    WidgetsFlutterBinding.ensureInitialized();

    di.setUpRegister(env);

    runApp(builder());
  }, (error, stack) {
    log(error.toString(), stackTrace: stack);
  });
}
''';

  // ─── VS Code launch.json ──────────────────────────────────────

  static const vscodeLaunchJson = '''
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "development",
      "request": "launch",
      "type": "dart",
      "program": "lib/main_development.dart",
      "args": ["--flavor", "development"]
    },
    {
      "name": "staging",
      "request": "launch",
      "type": "dart",
      "program": "lib/main_staging.dart",
      "args": ["--flavor", "staging"]
    },
    {
      "name": "production",
      "request": "launch",
      "type": "dart",
      "program": "lib/main_production.dart",
      "args": ["--flavor", "production"]
    }
  ]
}
''';

  // ─── Welcome view body (shared across all architectures) ───────

  static String welcomeViewBody(String archName) => '''
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.check_circle_outline,
                      size: 64,
                      color: theme.colorScheme.primary,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Welcome!',
                      style: theme.textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Your $archName project is ready.',
                      style: theme.textTheme.bodyLarge?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ],
                ),''';
}

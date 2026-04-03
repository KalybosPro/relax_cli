import 'dart:async';
import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason_logger/mason_logger.dart';

import '../../generators/model_generator.dart';

/// Generates a new RelaxORM model in the current Flutter project.
///
/// Usage: `relax generate model user_profile`
/// Alias: `relax g model user_profile`
class ModelCommand extends Command<int> {
  ModelCommand({required Logger logger}) : _logger = logger {
    argParser.addOption(
      'output',
      abbr: 'o',
      help: 'Output directory relative to lib/ (default: models).',
      defaultsTo: 'models',
    );
  }

  final Logger _logger;

  @override
  String get name => 'model';

  @override
  String get description =>
      'Generate a RelaxORM model class with @RelaxTable annotation.';

  @override
  String get invocation => 'relax generate model <model_name>';

  @override
  Future<int> run() async {
    final modelName = _getModelName();
    if (modelName == null) return ExitCode.usage.code;

    if (!_isValidName(modelName)) {
      _logger.err('Invalid model name: "$modelName"');
      _logger.info(
        'Model name must be lowercase letters, digits, underscores; '
        'must start with a letter.',
      );
      return ExitCode.usage.code;
    }

    final libDir = Directory('${Directory.current.path}/lib');
    if (!libDir.existsSync()) {
      _logger.err('No lib/ directory found.');
      _logger.info('Run this command from the root of a Flutter project.');
      return ExitCode.usage.code;
    }

    final outputDirName = argResults?['output'] as String;
    final outputDir = Directory('${libDir.path}/$outputDirName');
    final modelFile = File('${outputDir.path}/$modelName.dart');

    if (modelFile.existsSync()) {
      _logger.err('Model "$modelName" already exists in $outputDirName/.');
      return ExitCode.usage.code;
    }

    _logger.info('');
    _logger.info(
      'Generating model ${lightCyan.wrap(modelName)} '
      'in ${lightCyan.wrap('lib/$outputDirName/')}...',
    );
    _logger.info('');

    final generator = ModelGenerator(logger: _logger);

    try {
      final generatedFiles = await generator.generate(
        modelName: modelName,
        outputDir: outputDir,
      );

      _logger.info('');
      _logger.success(
        'Generated model "$modelName" '
        '(${generatedFiles.length} file).',
      );
      _logger.info('');

      _logger.info('Running build_runner to generate schema...');
      try {
        final buildResult = await Process.run(
          'dart',
          ['run', 'build_runner', 'build', '--delete-conflicting-outputs'],
          workingDirectory: Directory.current.path,
          runInShell: true,
        ).timeout(const Duration(minutes: 2));

        if (buildResult.exitCode == 0) {
          _logger.success('Code generation completed.');
        } else {
          _logger.warn(
            'build_runner finished with errors. '
            'Run ${lightCyan.wrap('dart run build_runner build')} manually.',
          );
          final stderr = buildResult.stderr.toString().trim();
          if (stderr.isNotEmpty) _logger.err(stderr);
        }
      } on TimeoutException {
        _logger.warn(
          'build_runner timed out. '
          'Run ${lightCyan.wrap('dart run build_runner build')} manually.',
        );
      } on Exception catch (_) {
        _logger.warn(
          'Could not run build_runner. '
          'Run ${lightCyan.wrap('dart run build_runner build')} manually.',
        );
      }
      _logger.info('');

      return ExitCode.success.code;
    } on FileSystemException catch (e) {
      _logger.err('File system error: ${e.message}');
      return ExitCode.ioError.code;
    } on Exception catch (e) {
      _logger.err('Unexpected error: $e');
      return ExitCode.software.code;
    }
  }

  String? _getModelName() {
    final args = argResults!.rest;
    if (args.isEmpty) {
      _logger.err('No model name specified.');
      _logger.info('Usage: $invocation');
      return null;
    }
    return args.first;
  }

  bool _isValidName(String name) {
    return RegExp(r'^[a-z][a-z0-9_]*$').hasMatch(name);
  }
}

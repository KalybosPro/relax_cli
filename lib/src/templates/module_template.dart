import 'package:mason/mason.dart';

/// Module templates — generates a domain/data layer module.
///
/// Variable: `module_name` (snake_case).
/// Files are generated relative to `lib/`.
abstract final class ModuleTemplate {
  static String _p(String path) => '{{module_name.snakeCase()}}/$path';

  static List<TemplateFile> get files => [
        TemplateFile(_p('{{module_name.snakeCase()}}.dart'), _barrel),

        // ── Models ──────────────────────────────────────────────
        TemplateFile(
          _p('models/{{module_name.snakeCase()}}.dart'),
          _model,
        ),

        // ── Repository (abstract) ───────────────────────────────
        TemplateFile(
          _p('repositories/{{module_name.snakeCase()}}_repository.dart'),
          _repository,
        ),

        // ── Repository (implementation) ─────────────────────────
        TemplateFile(
          _p('repositories/{{module_name.snakeCase()}}_repository_impl.dart'),
          _repositoryImpl,
        ),

        // ── Data source ─────────────────────────────────────────
        TemplateFile(
          _p('data_sources/{{module_name.snakeCase()}}_data_source.dart'),
          _dataSource,
        ),
      ];

  static const _barrel = '''
export 'models/{{module_name.snakeCase()}}.dart';
export 'repositories/{{module_name.snakeCase()}}_repository.dart';
export 'repositories/{{module_name.snakeCase()}}_repository_impl.dart';
export 'data_sources/{{module_name.snakeCase()}}_data_source.dart';
''';

  static const _model = '''
import 'package:flutter/foundation.dart';

@immutable
class {{module_name.pascalCase()}} {
  const {{module_name.pascalCase()}}({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  {{module_name.pascalCase()}} copyWith({
    String? id,
    String? name,
  }) {
    return {{module_name.pascalCase()}}(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is {{module_name.pascalCase()}} &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() => '{{module_name.pascalCase()}}(id: \$id, name: \$name)';
}
''';

  static const _repository = '''
import '../models/{{module_name.snakeCase()}}.dart';

/// Abstract repository for [{{module_name.pascalCase()}}] entities.
abstract interface class {{module_name.pascalCase()}}Repository {
  Future<List<{{module_name.pascalCase()}}>> getAll();

  Future<{{module_name.pascalCase()}}?> getById(String id);

  Future<void> create({{module_name.pascalCase()}} item);

  Future<void> update({{module_name.pascalCase()}} item);

  Future<void> delete(String id);
}
''';

  static const _repositoryImpl = '''
import '../data_sources/{{module_name.snakeCase()}}_data_source.dart';
import '../models/{{module_name.snakeCase()}}.dart';
import '{{module_name.snakeCase()}}_repository.dart';

class {{module_name.pascalCase()}}RepositoryImpl
    implements {{module_name.pascalCase()}}Repository {
  const {{module_name.pascalCase()}}RepositoryImpl({
    required {{module_name.pascalCase()}}DataSource dataSource,
  }) : _dataSource = dataSource;

  final {{module_name.pascalCase()}}DataSource _dataSource;

  @override
  Future<List<{{module_name.pascalCase()}}>> getAll() => _dataSource.getAll();

  @override
  Future<{{module_name.pascalCase()}}?> getById(String id) =>
      _dataSource.getById(id);

  @override
  Future<void> create({{module_name.pascalCase()}} item) =>
      _dataSource.create(item);

  @override
  Future<void> update({{module_name.pascalCase()}} item) =>
      _dataSource.update(item);

  @override
  Future<void> delete(String id) => _dataSource.delete(id);
}
''';

  static const _dataSource = '''
import '../models/{{module_name.snakeCase()}}.dart';

/// Data source for [{{module_name.pascalCase()}}] entities.
///
/// Replace this in-memory implementation with your actual
/// data source (API, database, etc.).
class {{module_name.pascalCase()}}DataSource {
  final List<{{module_name.pascalCase()}}> _items = [];

  Future<List<{{module_name.pascalCase()}}>> getAll() async => List.unmodifiable(_items);

  Future<{{module_name.pascalCase()}}?> getById(String id) async {
    return _items.where((item) => item.id == id).firstOrNull;
  }

  Future<void> create({{module_name.pascalCase()}} item) async {
    _items.add(item);
  }

  Future<void> update({{module_name.pascalCase()}} item) async {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index != -1) _items[index] = item;
  }

  Future<void> delete(String id) async {
    _items.removeWhere((item) => item.id == id);
  }
}
''';
}

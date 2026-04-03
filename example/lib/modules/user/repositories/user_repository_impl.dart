import '../data_sources/user_data_source.dart';
import '../models/user.dart';
import 'user_repository.dart';

class UserRepositoryImpl
    implements UserRepository {
  const UserRepositoryImpl({
    required UserDataSource dataSource,
  }) : _dataSource = dataSource;

  final UserDataSource _dataSource;

  @override
  Future<List<User>> getAll() => _dataSource.getAll();

  @override
  Future<User?> getById(String id) =>
      _dataSource.getById(id);

  @override
  Future<void> create(User item) =>
      _dataSource.create(item);

  @override
  Future<void> update(User item) =>
      _dataSource.update(item);

  @override
  Future<void> upsert(User item) =>
      _dataSource.upsert(item);

  @override
  Future<void> delete(String id) => _dataSource.delete(id);

  @override
  Stream<List<User>> watchAll() =>
      _dataSource.watchAll();
}

import 'package:relax_orm/relax_orm.dart';

import '../models/user.dart';

/// Data source for [User] backed by RelaxORM.
class UserDataSource {
  UserDataSource({required RelaxDB db})
      : _collection = db.collection<User>(userSchema);

  final Collection<User> _collection;

  Future<List<User>> getAll() => _collection.getAll();

  Future<User?> getById(String id) =>
      _collection.get(id);

  Future<void> create(User item) =>
      _collection.add(item);

  Future<void> update(User item) =>
      _collection.update(item);

  Future<void> upsert(User item) =>
      _collection.upsert(item);

  Future<void> delete(String id) => _collection.delete(id);

  Stream<List<User>> watchAll() =>
      _collection.watchAll();
}

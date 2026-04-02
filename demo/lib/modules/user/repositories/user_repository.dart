import '../models/user.dart';

/// Abstract repository for [User] entities.
abstract interface class UserRepository {
  Future<List<User>> getAll();

  Future<User?> getById(String id);

  Future<void> create(User item);

  Future<void> update(User item);

  Future<void> delete(String id);
}

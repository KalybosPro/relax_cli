import '../models/user.dart';

/// Data source for [User] entities.
///
/// Replace this in-memory implementation with your actual
/// data source (API, database, etc.).
class UserDataSource {
  final List<User> _items = [];

  Future<List<User>> getAll() async => List.unmodifiable(_items);

  Future<User?> getById(String id) async {
    return _items.where((item) => item.id == id).firstOrNull;
  }

  Future<void> create(User item) async {
    _items.add(item);
  }

  Future<void> update(User item) async {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index != -1) _items[index] = item;
  }

  Future<void> delete(String id) async {
    _items.removeWhere((item) => item.id == id);
  }
}

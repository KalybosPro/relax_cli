import '../models/product.dart';

/// Data source for [Product] entities.
///
/// Replace this in-memory implementation with your actual
/// data source (API, database, etc.).
class ProductDataSource {
  final List<Product> _items = [];

  Future<List<Product>> getAll() async => List.unmodifiable(_items);

  Future<Product?> getById(String id) async {
    return _items.where((item) => item.id == id).firstOrNull;
  }

  Future<void> create(Product item) async {
    _items.add(item);
  }

  Future<void> update(Product item) async {
    final index = _items.indexWhere((i) => i.id == item.id);
    if (index != -1) _items[index] = item;
  }

  Future<void> delete(String id) async {
    _items.removeWhere((item) => item.id == id);
  }
}

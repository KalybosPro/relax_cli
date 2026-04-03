import 'package:relax_orm/relax_orm.dart';

import '../models/product.dart';

/// Data source for [Product] backed by RelaxORM.
class ProductDataSource {
  ProductDataSource({required RelaxDB db})
      : _collection = db.collection<Product>(productSchema);

  final Collection<Product> _collection;

  Future<List<Product>> getAll() => _collection.getAll();

  Future<Product?> getById(String id) =>
      _collection.get(id);

  Future<void> create(Product item) =>
      _collection.add(item);

  Future<void> update(Product item) =>
      _collection.update(item);

  Future<void> upsert(Product item) =>
      _collection.upsert(item);

  Future<void> delete(String id) => _collection.delete(id);

  Stream<List<Product>> watchAll() =>
      _collection.watchAll();
}

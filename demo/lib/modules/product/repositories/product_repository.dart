import '../models/product.dart';

/// Abstract repository for [Product] entities.
abstract interface class ProductRepository {
  Future<List<Product>> getAll();

  Future<Product?> getById(String id);

  Future<void> create(Product item);

  Future<void> update(Product item);

  Future<void> delete(String id);
}

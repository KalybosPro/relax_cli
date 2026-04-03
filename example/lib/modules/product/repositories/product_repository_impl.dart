import '../data_sources/product_data_source.dart';
import '../models/product.dart';
import 'product_repository.dart';

class ProductRepositoryImpl
    implements ProductRepository {
  const ProductRepositoryImpl({
    required ProductDataSource dataSource,
  }) : _dataSource = dataSource;

  final ProductDataSource _dataSource;

  @override
  Future<List<Product>> getAll() => _dataSource.getAll();

  @override
  Future<Product?> getById(String id) =>
      _dataSource.getById(id);

  @override
  Future<void> create(Product item) =>
      _dataSource.create(item);

  @override
  Future<void> update(Product item) =>
      _dataSource.update(item);

  @override
  Future<void> upsert(Product item) =>
      _dataSource.upsert(item);

  @override
  Future<void> delete(String id) => _dataSource.delete(id);

  @override
  Stream<List<Product>> watchAll() =>
      _dataSource.watchAll();
}

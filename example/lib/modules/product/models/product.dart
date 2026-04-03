import 'package:relax_orm/relax_orm.dart';

part 'product.g.dart';

@RelaxTable()
class Product {
  @PrimaryKey()
  final String id;

  final String name;

  final DateTime createdAt;

  final DateTime updatedAt;

  Product({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });
}

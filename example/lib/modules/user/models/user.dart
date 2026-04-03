import 'package:relax_orm/relax_orm.dart';

part 'user.g.dart';

@RelaxTable()
class User {
  @PrimaryKey()
  final String id;

  final String name;

  final DateTime createdAt;

  final DateTime updatedAt;

  User({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
  });
}

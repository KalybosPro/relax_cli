import 'package:flutter/foundation.dart';

@immutable
class Product {
  const Product({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  Product copyWith({
    String? id,
    String? name,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() => 'Product(id: $id, name: $name)';
}

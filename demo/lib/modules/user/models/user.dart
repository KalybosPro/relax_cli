import 'package:flutter/foundation.dart';

@immutable
class User {
  const User({
    required this.id,
    required this.name,
  });

  final String id;
  final String name;

  User copyWith({
    String? id,
    String? name,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is User &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name;

  @override
  int get hashCode => id.hashCode ^ name.hashCode;

  @override
  String toString() => 'User(id: $id, name: $name)';
}

// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// RelaxTableGenerator
// **************************************************************************

// Schema for Product
final productSchema = TableSchema<Product>(
  tableName: 'products',
  columns: [
    ColumnDef.text('id', isPrimaryKey: true),
    ColumnDef.text('name'),
    ColumnDef.dateTime('created_at'),
    ColumnDef.dateTime('updated_at'),
  ],
  fromMap: (map) => Product(
    id: map['id'] as String,
    name: map['name'] as String,
    createdAt: map['created_at'] as DateTime,
    updatedAt: map['updated_at'] as DateTime,
  ),
  toMap: (entity) => {
    'id': entity.id,
    'name': entity.name,
    'created_at': entity.createdAt,
    'updated_at': entity.updatedAt,
  },
);

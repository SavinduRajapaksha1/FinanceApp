// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('');

Category _$CategoryFromJson(Map<String, dynamic> json) {
  return _Category.fromJson(json);
}

mixin _$Category {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  CategoryType get type => throw _privateConstructorUsedError;
  String get icon => throw _privateConstructorUsedError;
  Color get color => throw _privateConstructorUsedError;
  double get totalPlanned => throw _privateConstructorUsedError;
  double get totalActual => throw _privateConstructorUsedError;
  List<BudgetItem> get items => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

abstract class _Category implements Category {
  const factory _Category({
    required final String id,
    required final String name,
    required final CategoryType type,
    required final String icon,
    required final Color color,
    required final double totalPlanned,
    required final double totalActual,
    final List<BudgetItem> items,
  }) = _$CategoryImpl;

  factory _Category.fromJson(Map<String, dynamic> json) =
      _$CategoryImpl.fromJson;
}

class _$CategoryImpl implements _Category {
  const _$CategoryImpl({
    required this.id,
    required this.name,
    required this.type,
    required this.icon,
    required this.color,
    required this.totalPlanned,
    required this.totalActual,
    this.items = const [],
  });

  factory _$CategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final CategoryType type;
  @override
  final String icon;
  @override
  final Color color;
  @override
  final double totalPlanned;
  @override
  final double totalActual;
  @override
  final List<BudgetItem> items;

  @override
  String toString() {
    return 'Category(id: $id, name: $name, type: $type, icon: $icon, color: $color, totalPlanned: $totalPlanned, totalActual: $totalActual, items: $items)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryImplToJson(this);
  }
}

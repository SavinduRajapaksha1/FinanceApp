// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'budget_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('');

BudgetItem _$BudgetItemFromJson(Map<String, dynamic> json) {
  return _BudgetItem.fromJson(json);
}

/// @nodoc
mixin _$BudgetItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get planned => throw _privateConstructorUsedError;
  double get actual => throw _privateConstructorUsedError;
  DateTime? get dueDate => throw _privateConstructorUsedError;
  bool get isPaid => throw _privateConstructorUsedError;
  bool get isRecurring => throw _privateConstructorUsedError;
  String? get notes => throw _privateConstructorUsedError;
  List<String> get tags => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BudgetItemCopyWith<$Res> {
  factory $BudgetItemCopyWith(
          BudgetItem value, $Res Function(BudgetItem) then) =
      _$BudgetItemCopyWithImpl<$Res, BudgetItem>;
}

/// @nodoc
class _$BudgetItemCopyWithImpl<$Res, $Val extends BudgetItem>
    implements $BudgetItemCopyWith<$Res> {
  _$BudgetItemCopyWithImpl(this._value, this._then);

  final $Val _value;
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$BudgetItemImplCopyWith<$Res> {
  factory _$$BudgetItemImplCopyWith(
          _$BudgetItemImpl value, $Res Function(_$BudgetItemImpl) then) =
      __$$BudgetItemImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BudgetItemImplCopyWithImpl<$Res>
    extends _$BudgetItemCopyWithImpl<$Res, _$BudgetItemImpl>
    implements _$$BudgetItemImplCopyWith<$Res> {
  __$$BudgetItemImplCopyWithImpl(
      _$BudgetItemImpl _value, $Res Function(_$BudgetItemImpl) _then)
      : super(_value, _then);
}

/// @nodoc
class _$BudgetItemImpl implements _BudgetItem {
  const _$BudgetItemImpl({
    required this.id,
    required this.name,
    required this.planned,
    required this.actual,
    this.dueDate,
    this.isPaid = false,
    this.isRecurring = false,
    this.notes,
    this.tags = const [],
    required this.createdAt,
    this.updatedAt,
  });

  @override
  final String id;
  @override
  final String name;
  @override
  final double planned;
  @override
  final double actual;
  @override
  final DateTime? dueDate;
  @override
  final bool isPaid;
  @override
  final bool isRecurring;
  @override
  final String? notes;
  @override
  final List<String> tags;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  @override
  String toString() {
    return 'BudgetItem(id: $id, name: $name, planned: $planned, actual: $actual, dueDate: $dueDate, isPaid: $isPaid, isRecurring: $isRecurring, notes: $notes, tags: $tags, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'planned': planned,
      'actual': actual,
      'dueDate': dueDate?.toIso8601String(),
      'isPaid': isPaid,
      'isRecurring': isRecurring,
      'notes': notes,
      'tags': tags,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }
}

abstract class _BudgetItem implements BudgetItem {
  const factory _BudgetItem({
    required final String id,
    required final String name,
    required final double planned,
    required final double actual,
    final DateTime? dueDate,
    final bool isPaid,
    final bool isRecurring,
    final String? notes,
    final List<String> tags,
    required final DateTime createdAt,
    final DateTime? updatedAt,
  }) = _$BudgetItemImpl;
}

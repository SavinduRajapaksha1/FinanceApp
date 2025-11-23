// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetItemImpl _$$BudgetItemImplFromJson(Map<String, dynamic> json) =>
    _$BudgetItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      planned: (json['planned'] as num).toDouble(),
      actual: (json['actual'] as num).toDouble(),
      dueDate: json['dueDate'] == null
          ? null
          : DateTime.parse(json['dueDate'] as String),
      isPaid: json['isPaid'] as bool? ?? false,
      isRecurring: json['isRecurring'] as bool? ?? false,
      notes: json['notes'] as String?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const [],
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
    );

Map<String, dynamic> _$$BudgetItemImplToJson(_$BudgetItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'planned': instance.planned,
      'actual': instance.actual,
      'dueDate': instance.dueDate?.toIso8601String(),
      'isPaid': instance.isPaid,
      'isRecurring': instance.isRecurring,
      'notes': instance.notes,
      'tags': instance.tags,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };

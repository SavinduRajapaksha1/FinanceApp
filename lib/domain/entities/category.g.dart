// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      type: $enumDecode(_$CategoryTypeEnumMap, json['type']),
      icon: json['icon'] as String,
      color: Category._colorFromJson(json['color'] as String),
      totalPlanned: (json['totalPlanned'] as num).toDouble(),
      totalActual: (json['totalActual'] as num).toDouble(),
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => BudgetItem.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': _$CategoryTypeEnumMap[instance.type]!,
      'icon': instance.icon,
      'color': Category._colorToJson(instance.color),
      'totalPlanned': instance.totalPlanned,
      'totalActual': instance.totalActual,
      'items': instance.items,
    };

const _$CategoryTypeEnumMap = {
  CategoryType.income: 'income',
  CategoryType.bills: 'bills',
  CategoryType.expenses: 'expenses',
  CategoryType.debt: 'debt',
  CategoryType.savings: 'savings',
};

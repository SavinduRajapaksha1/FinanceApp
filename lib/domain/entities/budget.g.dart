// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'budget.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BudgetSummaryImpl _$$BudgetSummaryImplFromJson(Map<String, dynamic> json) =>
    _$BudgetSummaryImpl(
      totalPlannedIncome: (json['totalPlannedIncome'] as num).toDouble(),
      totalActualIncome: (json['totalActualIncome'] as num).toDouble(),
      totalPlannedOutflow: (json['totalPlannedOutflow'] as num).toDouble(),
      totalActualOutflow: (json['totalActualOutflow'] as num).toDouble(),
      amountLeft: (json['amountLeft'] as num).toDouble(),
      savingsRate: (json['savingsRate'] as num).toDouble(),
    );

Map<String, dynamic> _$$BudgetSummaryImplToJson(_$BudgetSummaryImpl instance) =>
    <String, dynamic>{
      'totalPlannedIncome': instance.totalPlannedIncome,
      'totalActualIncome': instance.totalActualIncome,
      'totalPlannedOutflow': instance.totalPlannedOutflow,
      'totalActualOutflow': instance.totalActualOutflow,
      'amountLeft': instance.amountLeft,
      'savingsRate': instance.savingsRate,
    };

_$BudgetImpl _$$BudgetImplFromJson(Map<String, dynamic> json) => _$BudgetImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      month: json['month'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      summary: BudgetSummary.fromJson(json['summary'] as Map<String, dynamic>),
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$BudgetImplToJson(_$BudgetImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'month': instance.month,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'summary': instance.summary,
      'categories': instance.categories,
    };

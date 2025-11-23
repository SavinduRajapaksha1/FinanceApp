// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, unused_element

part of 'budget.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError('');

BudgetSummary _$BudgetSummaryFromJson(Map<String, dynamic> json) {
  return _BudgetSummary.fromJson(json);
}

mixin _$BudgetSummary {
  double get totalPlannedIncome => throw _privateConstructorUsedError;
  double get totalActualIncome => throw _privateConstructorUsedError;
  double get totalPlannedOutflow => throw _privateConstructorUsedError;
  double get totalActualOutflow => throw _privateConstructorUsedError;
  double get amountLeft => throw _privateConstructorUsedError;
  double get savingsRate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

class _$BudgetSummaryImpl implements _BudgetSummary {
  const _$BudgetSummaryImpl({
    required this.totalPlannedIncome,
    required this.totalActualIncome,
    required this.totalPlannedOutflow,
    required this.totalActualOutflow,
    required this.amountLeft,
    required this.savingsRate,
  });

  @override
  final double totalPlannedIncome;
  @override
  final double totalActualIncome;
  @override
  final double totalPlannedOutflow;
  @override
  final double totalActualOutflow;
  @override
  final double amountLeft;
  @override
  final double savingsRate;

  @override
  String toString() {
    return 'BudgetSummary(totalPlannedIncome: $totalPlannedIncome, totalActualIncome: $totalActualIncome, totalPlannedOutflow: $totalPlannedOutflow, totalActualOutflow: $totalActualOutflow, amountLeft: $amountLeft, savingsRate: $savingsRate)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetSummaryImplToJson(this);
  }
}

Budget _$BudgetFromJson(Map<String, dynamic> json) {
  return _Budget.fromJson(json);
}

mixin _$Budget {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get month => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  BudgetSummary get summary => throw _privateConstructorUsedError;
  List<Category> get categories => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

class _$BudgetImpl implements _Budget {
  const _$BudgetImpl({
    required this.id,
    required this.userId,
    required this.month,
    required this.createdAt,
    required this.updatedAt,
    required this.summary,
    this.categories = const [],
  });

  @override
  final String id;
  @override
  final String userId;
  @override
  final String month;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final BudgetSummary summary;
  @override
  final List<Category> categories;

  @override
  String toString() {
    return 'Budget(id: $id, userId: $userId, month: $month, createdAt: $createdAt, updatedAt: $updatedAt, summary: $summary, categories: $categories)';
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$BudgetImplToJson(this);
  }
}

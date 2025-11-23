import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:financial_planner_pro/domain/entities/category.dart';

part 'budget.freezed.dart';
part 'budget.g.dart';

@freezed
class BudgetSummary with _$BudgetSummary {
  const factory BudgetSummary({
    required double totalPlannedIncome,
    required double totalActualIncome,
    required double totalPlannedOutflow,
    required double totalActualOutflow,
    required double amountLeft,
    required double savingsRate,
  }) = _BudgetSummary;

  factory BudgetSummary.fromJson(Map<String, dynamic> json) =>
      _$BudgetSummaryFromJson(json);
}

@freezed
class Budget with _$Budget {
  const factory Budget({
    required String id,
    required String userId,
    required String month,
    required DateTime createdAt,
    required DateTime updatedAt,
    required BudgetSummary summary,
    @Default([]) List<Category> categories,
  }) = _Budget;

  factory Budget.fromJson(Map<String, dynamic> json) =>
      _$BudgetFromJson(json);
}

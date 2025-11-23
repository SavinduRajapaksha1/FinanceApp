import 'package:freezed_annotation/freezed_annotation.dart';

part 'budget_item.freezed.dart';
part 'budget_item.g.dart';

@freezed
class BudgetItem with _$BudgetItem {
  const factory BudgetItem({
    required String id,
    required String name,
    required double planned,
    required double actual,
    DateTime? dueDate,
    @Default(false) bool isPaid,
    @Default(false) bool isRecurring,
    String? notes,
    @Default([]) List<String> tags,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _BudgetItem;

  factory BudgetItem.fromJson(Map<String, dynamic> json) =>
      _$BudgetItemFromJson(json);
}

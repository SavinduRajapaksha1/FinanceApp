import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:financial_planner_pro/domain/entities/budget_item.dart';
import 'package:flutter/material.dart';

part 'category.freezed.dart';
part 'category.g.dart';

enum CategoryType {
  income,
  bills,
  expenses,
  debt,
  savings,
}

@freezed
class Category with _$Category {
  const factory Category({
    required String id,
    required String name,
    required CategoryType type,
    required String icon,
    @JsonKey(fromJson: _colorFromJson, toJson: _colorToJson)
    required Color color,
    required double totalPlanned,
    required double totalActual,
    @Default([]) List<BudgetItem> items,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  static Color _colorFromJson(String colorString) {
    return Color(int.parse(colorString.substring(1), radix: 16) + 0xFF000000);
  }

  static String _colorToJson(Color color) {
    return '#${color.value.toRadixString(16).substring(2).toUpperCase()}';
  }
}

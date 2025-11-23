import 'package:flutter/material.dart';
import 'package:financial_planner_pro/core/constants/app_colors.dart';
import 'package:financial_planner_pro/core/constants/app_dimensions.dart';
import 'package:financial_planner_pro/core/utils/date_formatter.dart';

class MonthSelector extends StatelessWidget {
  final DateTime selectedMonth;
  final ValueChanged<DateTime> onMonthChanged;

  const MonthSelector({
    super.key,
    required this.selectedMonth,
    required this.onMonthChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppDimensions.paddingM,
        vertical: AppDimensions.paddingS,
      ),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () {
              final newMonth = DateTime(
                selectedMonth.year,
                selectedMonth.month - 1,
              );
              onMonthChanged(newMonth);
            },
            color: AppColors.primary,
          ),
          GestureDetector(
            onTap: () => _showMonthPicker(context),
            child: Row(
              children: [
                Text(
                  DateFormatter.formatMonthYear(selectedMonth),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimary,
                      ),
                ),
                const SizedBox(width: AppDimensions.paddingS),
                const Icon(
                  Icons.arrow_drop_down,
                  color: AppColors.primary,
                ),
              ],
            ),
          ),
          IconButton(
            icon: const Icon(Icons.chevron_right),
            onPressed: () {
              final newMonth = DateTime(
                selectedMonth.year,
                selectedMonth.month + 1,
              );
              onMonthChanged(newMonth);
            },
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }

  void _showMonthPicker(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Month'),
        content: SizedBox(
          width: 300,
          height: 300,
          child: YearPicker(
            firstDate: DateTime(2020),
            lastDate: DateTime(2030),
            selectedDate: selectedMonth,
            onChanged: (date) {
              Navigator.pop(context);
              onMonthChanged(date);
            },
          ),
        ),
      ),
    );
  }
}

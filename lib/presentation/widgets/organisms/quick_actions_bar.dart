import 'package:flutter/material.dart';
import 'package:financial_planner_pro/core/constants/app_dimensions.dart';
import 'package:financial_planner_pro/presentation/widgets/atoms/app_button.dart';

class QuickActionsBar extends StatelessWidget {
  final VoidCallback onAddIncome;
  final VoidCallback onAddExpense;
  final VoidCallback onAddBill;

  const QuickActionsBar({
    super.key,
    required this.onAddIncome,
    required this.onAddExpense,
    required this.onAddBill,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      child: Row(
        children: [
          Expanded(
            child: AppButton(
              label: 'Income',
              icon: Icons.add,
              size: ButtonSize.small,
              onPressed: onAddIncome,
            ),
          ),
          const SizedBox(width: AppDimensions.paddingS),
          Expanded(
            child: AppButton(
              label: 'Expense',
              icon: Icons.add,
              size: ButtonSize.small,
              type: ButtonType.outlined,
              onPressed: onAddExpense,
            ),
          ),
          const SizedBox(width: AppDimensions.paddingS),
          Expanded(
            child: AppButton(
              label: 'Bill',
              icon: Icons.add,
              size: ButtonSize.small,
              type: ButtonType.outlined,
              onPressed: onAddBill,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:financial_planner_pro/core/constants/app_colors.dart';
import 'package:financial_planner_pro/core/constants/app_dimensions.dart';
import 'package:financial_planner_pro/presentation/widgets/molecules/kpi_card.dart';

class KPICardsSection extends StatelessWidget {
  final double income;
  final double spent;
  final double left;
  final String? incomePercentage;
  final String? spentPercentage;

  const KPICardsSection({
    super.key,
    required this.income,
    required this.spent,
    required this.left,
    this.incomePercentage,
    this.spentPercentage,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: AppDimensions.paddingM),
      child: Row(
        children: [
          KPICard(
            title: 'Income',
            amount: income,
            percentage: incomePercentage,
            isPositive: true,
            backgroundColor: AppColors.incomeColor,
            icon: Icons.account_balance_wallet,
          ),
          const SizedBox(width: AppDimensions.paddingM),
          KPICard(
            title: 'Spent',
            amount: spent,
            percentage: spentPercentage,
            isPositive: false,
            backgroundColor: AppColors.expensesColor,
            icon: Icons.shopping_bag,
          ),
          const SizedBox(width: AppDimensions.paddingM),
          KPICard(
            title: 'Available',
            amount: left,
            backgroundColor: AppColors.primary,
            icon: Icons.savings,
          ),
        ],
      ),
    );
  }
}

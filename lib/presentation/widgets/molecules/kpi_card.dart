import 'package:flutter/material.dart';
import 'package:financial_planner_pro/core/constants/app_colors.dart';
import 'package:financial_planner_pro/core/constants/app_dimensions.dart';
import 'package:financial_planner_pro/core/utils/currency_formatter.dart';

class KPICard extends StatelessWidget {
  final String title;
  final double amount;
  final String? percentage;
  final bool isPositive;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback? onTap;

  const KPICard({
    super.key,
    required this.title,
    required this.amount,
    this.percentage,
    this.isPositive = true,
    this.backgroundColor = AppColors.primary,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160,
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppDimensions.radiusL),
          border: Border.all(color: backgroundColor.withOpacity(0.3)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(icon, color: backgroundColor, size: AppDimensions.iconM),
                if (percentage != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppDimensions.paddingS,
                      vertical: AppDimensions.paddingXS,
                    ),
                    decoration: BoxDecoration(
                      color: (isPositive ? AppColors.success : AppColors.error)
                          .withOpacity(0.1),
                      borderRadius: BorderRadius.circular(AppDimensions.radiusS),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          isPositive ? Icons.arrow_upward : Icons.arrow_downward,
                          size: 12,
                          color: isPositive ? AppColors.success : AppColors.error,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          percentage!,
                          style: TextStyle(
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            color: isPositive ? AppColors.success : AppColors.error,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
            const SizedBox(height: AppDimensions.paddingM),
            Text(
              title,
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondary,
                  ),
            ),
            const SizedBox(height: AppDimensions.paddingXS),
            Text(
              CurrencyFormatter.format(amount),
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: backgroundColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

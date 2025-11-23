import 'package:flutter/material.dart';
import 'package:financial_planner_pro/core/constants/app_colors.dart';
import 'package:financial_planner_pro/core/constants/app_dimensions.dart';
import 'package:financial_planner_pro/core/utils/currency_formatter.dart';
import 'package:financial_planner_pro/domain/entities/budget_item.dart';

class BudgetItemRow extends StatelessWidget {
  final BudgetItem item;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final bool showProgress;

  const BudgetItemRow({
    super.key,
    required this.item,
    this.onTap,
    this.onDelete,
    this.showProgress = true,
  });

  @override
  Widget build(BuildContext context) {
    final progress = item.planned > 0 ? (item.actual / item.planned) : 0.0;
    final isOverBudget = item.actual > item.planned;

    return Dismissible(
      key: Key(item.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: AppDimensions.paddingM),
        color: AppColors.error,
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      onDismissed: (_) => onDelete?.call(),
      child: InkWell(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(AppDimensions.paddingM),
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: AppColors.textTertiary.withOpacity(0.2),
              ),
            ),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item.name,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        if (item.notes?.isNotEmpty ?? false)
                          Text(
                            item.notes!,
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      CurrencyFormatter.format(item.planned),
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      CurrencyFormatter.format(item.actual),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                            color: isOverBudget ? AppColors.error : AppColors.success,
                          ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    width: 40,
                    child: Icon(
                      item.isPaid ? Icons.check_circle : Icons.pending,
                      color: item.isPaid ? AppColors.success : AppColors.warning,
                      size: AppDimensions.iconM,
                    ),
                  ),
                ],
              ),
              if (showProgress) ...[
                const SizedBox(height: AppDimensions.paddingS),
                ClipRRect(
                  borderRadius: BorderRadius.circular(AppDimensions.radiusS),
                  child: LinearProgressIndicator(
                    value: progress.clamp(0.0, 1.0),
                    backgroundColor: AppColors.textTertiary.withOpacity(0.2),
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isOverBudget ? AppColors.error : AppColors.success,
                    ),
                    minHeight: 4,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

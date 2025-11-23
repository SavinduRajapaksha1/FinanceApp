import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:financial_planner_pro/core/constants/app_colors.dart';
import 'package:financial_planner_pro/core/constants/app_dimensions.dart';
import 'package:financial_planner_pro/core/utils/currency_formatter.dart';
import 'package:financial_planner_pro/core/utils/date_formatter.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('History & Analytics'),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {
              // Export functionality
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppDimensions.paddingM),
        children: [
          Text(
            'Monthly Timeline',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppDimensions.paddingM),
          _buildMonthCard(
            context,
            month: 'November 2025',
            income: 3400,
            spent: 2800,
            saved: 600,
            savingsRate: 17.6,
          ),
          const SizedBox(height: AppDimensions.paddingM),
          _buildMonthCard(
            context,
            month: 'October 2025',
            income: 3200,
            spent: 2450,
            saved: 750,
            savingsRate: 23.4,
          ),
          const SizedBox(height: AppDimensions.paddingM),
          _buildMonthCard(
            context,
            month: 'September 2025',
            income: 3000,
            spent: 2300,
            saved: 700,
            savingsRate: 23.3,
          ),
          const SizedBox(height: AppDimensions.paddingL),
          Text(
            'Insights & Recommendations',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          const SizedBox(height: AppDimensions.paddingM),
          _buildInsightCard(
            context,
            icon: Icons.lightbulb,
            title: 'Spending Pattern',
            message: 'Your average monthly spending is consistent at around \$2,500',
            color: AppColors.info,
          ),
          const SizedBox(height: AppDimensions.paddingM),
          _buildInsightCard(
            context,
            icon: Icons.trending_up,
            title: 'Savings Goal',
            message: 'You\'re saving 21% on average. Great progress!',
            color: AppColors.success,
          ),
        ],
      ),
    );
  }

  Widget _buildMonthCard(
    BuildContext context, {
    required String month,
    required double income,
    required double spent,
    required double saved,
    required double savingsRate,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            month,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
          const SizedBox(height: AppDimensions.paddingM),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMonthStat(context, 'Income', income, AppColors.incomeColor),
              _buildMonthStat(context, 'Spent', spent, AppColors.expensesColor),
              _buildMonthStat(context, 'Saved', saved, AppColors.savingsColor),
            ],
          ),
          const SizedBox(height: AppDimensions.paddingM),
          Container(
            padding: const EdgeInsets.all(AppDimensions.paddingS),
            decoration: BoxDecoration(
              color: AppColors.success.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppDimensions.radiusS),
            ),
            child: Text(
              'Savings rate: ${savingsRate.toStringAsFixed(1)}%',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: AppColors.success,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthStat(
    BuildContext context,
    String label,
    double amount,
    Color color,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
        ),
        const SizedBox(height: 4),
        Text(
          CurrencyFormatter.format(amount),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: color,
              ),
        ),
      ],
    );
  }

  Widget _buildInsightCard(
    BuildContext context, {
    required IconData icon,
    required String title,
    required String message,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(AppDimensions.paddingM),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(AppDimensions.paddingM),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: AppDimensions.paddingM),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 4),
                Text(
                  message,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

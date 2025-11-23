import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:financial_planner_pro/core/constants/app_colors.dart';
import 'package:financial_planner_pro/core/constants/app_dimensions.dart';
import 'package:financial_planner_pro/core/utils/date_formatter.dart';
import 'package:financial_planner_pro/presentation/widgets/molecules/month_selector.dart';
import 'package:financial_planner_pro/presentation/widgets/organisms/kpi_cards_section.dart';
import 'package:financial_planner_pro/presentation/widgets/organisms/quick_actions_bar.dart';
import 'package:financial_planner_pro/presentation/widgets/organisms/summary_table.dart';
import 'package:financial_planner_pro/presentation/widgets/atoms/empty_state.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  DateTime selectedMonth = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(AppDimensions.paddingM),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Hi, User!',
                          style: Theme.of(context).textTheme.headlineMedium,
                        ),
                        IconButton(
                          icon: const Icon(Icons.settings),
                          onPressed: () {
                            // Navigate to settings
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: AppDimensions.paddingS),
                    MonthSelector(
                      selectedMonth: selectedMonth,
                      onMonthChanged: (month) {
                        setState(() {
                          selectedMonth = month;
                        });
                      },
                    ),
                    const SizedBox(height: AppDimensions.paddingXS),
                    Text(
                      'Last updated: ${DateFormatter.timeAgo(DateTime.now())}',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppDimensions.paddingM),
            ),
            const SliverToBoxAdapter(
              child: KPICardsSection(
                income: 3200,
                spent: 2450,
                left: 750,
                incomePercentage: '6.7%',
                spentPercentage: '3.2%',
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppDimensions.paddingL),
            ),
            SliverToBoxAdapter(
              child: QuickActionsBar(
                onAddIncome: () => _showAddDialog(context, 'Income'),
                onAddExpense: () => _showAddDialog(context, 'Expense'),
                onAddBill: () => _showAddDialog(context, 'Bill'),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppDimensions.paddingL),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppDimensions.paddingM,
                ),
                child: Text(
                  'Budget Summary',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppDimensions.paddingM),
            ),
            const SliverToBoxAdapter(
              child: SummaryTable(
                categories: [], // Will be populated from provider
              ),
            ),
            const SliverToBoxAdapter(
              child: SizedBox(height: AppDimensions.paddingL),
            ),
          ],
        ),
      ),
    );
  }

  void _showAddDialog(BuildContext context, String type) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Add $type'),
        content: const Text('Add item dialog will be implemented here'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}

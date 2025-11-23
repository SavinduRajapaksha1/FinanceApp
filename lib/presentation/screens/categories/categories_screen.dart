import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:financial_planner_pro/core/constants/app_colors.dart';
import 'package:financial_planner_pro/core/constants/app_dimensions.dart';
import 'package:financial_planner_pro/domain/entities/category.dart';
import 'package:financial_planner_pro/presentation/widgets/atoms/empty_state.dart';

class CategoriesScreen extends ConsumerStatefulWidget {
  const CategoriesScreen({super.key});

  @override
  ConsumerState<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends ConsumerState<CategoriesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categories'),
        bottom: TabBar(
          controller: _tabController,
          isScrollable: true,
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.textSecondary,
          indicatorColor: AppColors.primary,
          tabs: const [
            Tab(text: '💵 Income'),
            Tab(text: '🏠 Bills'),
            Tab(text: '🛒 Expenses'),
            Tab(text: '💳 Debt'),
            Tab(text: '🐷 Savings'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildCategoryTab(CategoryType.income),
          _buildCategoryTab(CategoryType.bills),
          _buildCategoryTab(CategoryType.expenses),
          _buildCategoryTab(CategoryType.debt),
          _buildCategoryTab(CategoryType.savings),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _showAddItemDialog(),
        backgroundColor: AppColors.primary,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildCategoryTab(CategoryType type) {
    return EmptyState(
      icon: Icons.category,
      title: 'No items yet',
      message: 'Tap the + button to add your first item',
    );
  }

  void _showAddItemDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Item'),
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

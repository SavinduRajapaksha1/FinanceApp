# 🚀 Flutter Financial Planner Pro - Expert Build Prompt

## 📋 Executive Summary

Build a production-grade **Financial Planner Pro** iOS app using Flutter with clean architecture, atomic component design, and Firebase Firestore backend. The app enables users to track income, expenses, bills, debt, and savings with real-time analytics and historical insights.

---

## 🎯 Core Requirements

### Technical Stack
- **Framework**: Flutter 3.x+
- **State Management**: Riverpod 2.x
- **Backend**: Firebase Firestore
- **Auth**: Firebase Authentication
- **Charts**: fl_chart package
- **Platform**: iOS-first (Android-ready architecture)

### Architecture Principles
1. **Clean Architecture** (Data → Domain → Presentation layers)
2. **Atomic Design** (Atoms → Molecules → Organisms → Templates → Pages)
3. **SOLID principles** throughout
4. **Repository pattern** for data access
5. **Dependency injection** via Riverpod
6. **Immutable state** with freezed/json_serializable

---

## 📱 App Flow & Screen Structure

### Bottom Navigation (3 Tabs)

#### 1️⃣ **Home (Dashboard)**
**Path**: `/home`

**Layout Order** (top to bottom):

**A. Header Section**
```
├─ Month Selector (dropdown: "September 2025" ▼)
├─ Greeting: "Hi [Username]" (optional)
└─ Last Updated: timestamp
```

**B. KPI Cards Row** (Horizontal scroll if needed)
```
┌─────────────┐ ┌─────────────┐ ┌─────────────┐
│  💰 Income  │ │  💸 Spent   │ │  ✅ Left    │
│   $3,200    │ │   $2,450    │ │    $750     │
│  ↑ +6.7%    │ │  ↓ -3.2%    │ │  vs planned │
└─────────────┘ └─────────────┘ └─────────────┘
```

**C. Quick Actions**
```
[+ Add Income]  [+ Add Expense]  [+ Add Bill]
```

**D. Visual Analytics Section**
```
├─ Donut Chart: "Spending Breakdown"
│  (Shows % distribution: Bills, Food, Savings, etc.)
│
├─ Bar Chart: "Planned vs Actual"
│  (Compare planned/actual for each category)
│
└─ Progress Rings: Per-category budget usage
```

**E. Quick Summary Table**
```
Category    | Planned | Actual | Remaining | Progress
------------|---------|--------|-----------|----------
Income      | $3,000  | $3,200 |   +$200   | 107% ✅
Bills       | $1,200  | $1,150 |    $50    |  96% ✅
Expenses    | $800    | $900   |   -$100   | 113% ⚠️
Debt        | $500    | $500   |     $0    | 100% ✅
Savings     | $400    | $400   |     $0    | 100% ✅
```

---

#### 2️⃣ **Categories (Detailed Tables)**
**Path**: `/categories`

**Top Tabs/Segments**:
- 💵 Income
- 🏠 Bills  
- 🛒 Expenses
- 💳 Debt
- 🐷 Savings

**Each Category Shows**:

**Table View**:
```
┌─────────────────────────────────────────────┐
│ Item Name       | Planned | Actual | Status │
├─────────────────────────────────────────────┤
│ Rent            | $1,000  | $1,000 |   ✓    │
│ Electricity     |   $150  |  $142  |   ✓    │
│ Internet        |    $60  |   $60  |   ✓    │
│ [+ Add New]                                  │
└─────────────────────────────────────────────┘
```

**Features**:
- ✅ Tap row to edit
- ✅ Swipe left to delete
- ✅ Long press for options (duplicate, mark paid, etc.)
- ✅ Add notes/tags to each item
- ✅ Set due dates for bills
- ✅ Mark as recurring vs one-time
- ✅ Filter: All / Paid / Pending / Overdue
- ✅ Sort: Name, Amount, Date, Status

---

#### 3️⃣ **History & Analytics**
**Path**: `/history`

**Section A: Month Timeline**
```
┌─ November 2025 ──────────────┐
│ Income: $3,400 | Spent: $2,800│
│ Saved: $600 (17.6% rate)     │
│ Tap to view details →        │
└──────────────────────────────┘

┌─ October 2025 ───────────────┐
│ Income: $3,200 | Spent: $2,450│
│ Saved: $750 (23.4% rate)     │
└──────────────────────────────┘
```

**Section B: Analytics Dashboard**

**Charts**:
1. **Line Chart**: Income vs Expenses trend (last 6 months)
2. **Stacked Bar**: Category breakdown per month
3. **Pie Chart**: Average spending distribution
4. **Heatmap**: Spending intensity by category/month

**Section C: Insights & Recommendations** (AI-generated)
```
💡 Insights:
• Your grocery spending increased 15% this month
• You're saving 18% more than last quarter
• Bills are consistently under budget - great job!

🎯 Recommendations:
• Consider increasing savings goal to $500
• Food expenses trending up - review subscriptions
```

**Section D: Export Options**
```
[📊 Export to CSV]  [📄 Generate PDF Report]
```

---

## 🏗️ Architecture & Folder Structure

```
lib/
├── main.dart
│
├── core/
│   ├── config/
│   │   ├── app_config.dart
│   │   └── firebase_config.dart
│   ├── constants/
│   │   ├── app_colors.dart
│   │   ├── app_strings.dart
│   │   ├── app_dimensions.dart
│   │   └── asset_paths.dart
│   ├── theme/
│   │   ├── app_theme.dart
│   │   ├── light_theme.dart
│   │   └── dark_theme.dart (future)
│   ├── utils/
│   │   ├── date_utils.dart
│   │   ├── currency_formatter.dart
│   │   ├── validators.dart
│   │   └── extensions.dart
│   └── errors/
│       ├── failures.dart
│       └── exceptions.dart
│
├── data/
│   ├── models/
│   │   ├── budget_model.dart (freezed)
│   │   ├── category_model.dart
│   │   ├── budget_item_model.dart
│   │   ├── user_model.dart
│   │   └── analytics_model.dart
│   ├── repositories/
│   │   ├── budget_repository_impl.dart
│   │   ├── auth_repository_impl.dart
│   │   └── analytics_repository_impl.dart
│   └── datasources/
│       ├── firestore_datasource.dart
│       ├── local_cache_datasource.dart (Hive/SharedPrefs)
│       └── remote_config_datasource.dart
│
├── domain/
│   ├── entities/
│   │   ├── budget.dart
│   │   ├── category.dart
│   │   ├── budget_item.dart
│   │   └── user.dart
│   ├── repositories/
│   │   ├── budget_repository.dart (abstract)
│   │   ├── auth_repository.dart
│   │   └── analytics_repository.dart
│   └── usecases/
│       ├── get_monthly_budget.dart
│       ├── add_budget_item.dart
│       ├── update_budget_item.dart
│       ├── delete_budget_item.dart
│       ├── calculate_totals.dart
│       └── generate_insights.dart
│
├── presentation/
│   ├── app.dart
│   ├── router/
│   │   └── app_router.dart (go_router)
│   │
│   ├── screens/
│   │   ├── home/
│   │   │   ├── home_screen.dart
│   │   │   ├── home_controller.dart (Riverpod)
│   │   │   └── home_state.dart (freezed)
│   │   ├── categories/
│   │   │   ├── categories_screen.dart
│   │   │   ├── category_detail_screen.dart
│   │   │   ├── categories_controller.dart
│   │   │   └── categories_state.dart
│   │   ├── history/
│   │   │   ├── history_screen.dart
│   │   │   ├── history_controller.dart
│   │   │   └── history_state.dart
│   │   ├── auth/
│   │   │   ├── login_screen.dart
│   │   │   └── signup_screen.dart
│   │   └── settings/
│   │       └── settings_screen.dart
│   │
│   ├── widgets/ (Atomic Design)
│   │   │
│   │   ├── atoms/ (smallest reusable pieces)
│   │   │   ├── app_button.dart
│   │   │   ├── app_text_field.dart
│   │   │   ├── app_icon.dart
│   │   │   ├── app_badge.dart
│   │   │   ├── loading_indicator.dart
│   │   │   ├── empty_state.dart
│   │   │   └── error_widget.dart
│   │   │
│   │   ├── molecules/ (combinations of atoms)
│   │   │   ├── kpi_card.dart
│   │   │   ├── month_selector.dart
│   │   │   ├── progress_indicator_card.dart
│   │   │   ├── budget_item_row.dart
│   │   │   ├── category_chip.dart
│   │   │   ├── search_bar.dart
│   │   │   └── filter_dropdown.dart
│   │   │
│   │   ├── organisms/ (complex components)
│   │   │   ├── kpi_cards_section.dart
│   │   │   ├── quick_actions_bar.dart
│   │   │   ├── summary_table.dart
│   │   │   ├── category_table.dart
│   │   │   ├── donut_chart_card.dart
│   │   │   ├── bar_chart_card.dart
│   │   │   ├── line_chart_card.dart
│   │   │   ├── month_history_card.dart
│   │   │   ├── insight_card.dart
│   │   │   └── bottom_nav_bar.dart
│   │   │
│   │   └── templates/ (page layouts)
│   │       ├── dashboard_template.dart
│   │       ├── table_view_template.dart
│   │       └── analytics_template.dart
│   │
│   └── dialogs/
│       ├── add_item_dialog.dart
│       ├── edit_item_dialog.dart
│       ├── delete_confirmation_dialog.dart
│       └── month_picker_dialog.dart
│
└── providers/
    ├── auth_provider.dart
    ├── budget_provider.dart
    ├── category_provider.dart
    ├── analytics_provider.dart
    └── theme_provider.dart
```

---

## 🗄️ Firebase Firestore Data Model

### Collection Structure
```
/users/{userId}
  ├─ profile: { name, email, createdAt }
  ├─ settings: { currency, theme, notifications }
  │
  └─ /budgets/{monthId}  // monthId format: "2025-09"
      ├─ month: "September 2025"
      ├─ createdAt: timestamp
      ├─ updatedAt: timestamp
      │
      ├─ summary: {
      │    totalPlannedIncome: 3000,
      │    totalActualIncome: 3200,
      │    totalPlannedOutflow: 2900,
      │    totalActualOutflow: 2450,
      │    amountLeft: 750,
      │    savingsRate: 23.4
      │  }
      │
      ├─ /categories/{categoryId}
      │   ├─ name: "Bills"
      │   ├─ icon: "home"
      │   ├─ color: "#A78BFA"
      │   ├─ totalPlanned: 1200
      │   ├─ totalActual: 1150
      │   │
      │   └─ /items/{itemId}
      │       ├─ name: "Rent"
      │       ├─ planned: 1000
      │       ├─ actual: 1000
      │       ├─ dueDate: timestamp
      │       ├─ isPaid: true
      │       ├─ isRecurring: true
      │       ├─ notes: "..."
      │       ├─ tags: ["housing", "essential"]
      │       └─ createdAt: timestamp
```

### Firestore Rules (Security)
```javascript
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /users/{userId} {
      allow read, write: if request.auth != null && request.auth.uid == userId;
      
      match /budgets/{monthId} {
        allow read, write: if request.auth != null && request.auth.uid == userId;
        
        match /categories/{categoryId} {
          allow read, write: if request.auth != null && request.auth.uid == userId;
          
          match /items/{itemId} {
            allow read, write: if request.auth != null && request.auth.uid == userId;
          }
        }
      }
    }
  }
}
```

---

## 🧩 Widget Implementation Guide

### 1. Atoms (Base Components)

#### AppButton
```dart
enum ButtonType { primary, secondary, outlined, text }
enum ButtonSize { small, medium, large }

class AppButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final ButtonType type;
  final ButtonSize size;
  final IconData? icon;
  final bool isLoading;
  final bool isDisabled;
  // ...
}
```

#### AppTextField
```dart
class AppTextField extends StatelessWidget {
  final String? label;
  final String? hint;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final Widget? suffix;
  final int? maxLines;
  final bool obscureText;
  // ...
}
```

### 2. Molecules

#### KPICard
```dart
class KPICard extends StatelessWidget {
  final String title;
  final double amount;
  final String? percentage;
  final bool isPositive;
  final Color backgroundColor;
  final IconData icon;
  final VoidCallback? onTap;
  // Shows: Icon, Title, Amount, % change indicator
}
```

#### BudgetItemRow
```dart
class BudgetItemRow extends StatelessWidget {
  final BudgetItem item;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;
  final bool showProgress;
  // Shows: Name, Planned, Actual, Progress bar, Status icon
}
```

### 3. Organisms

#### SummaryTable
```dart
class SummaryTable extends StatelessWidget {
  final List<CategorySummary> categories;
  final bool isLoading;
  // Displays full planned vs actual table with totals
}
```

#### DonutChartCard
```dart
class DonutChartCard extends StatelessWidget {
  final String title;
  final Map<String, double> data;
  final bool showLegend;
  // Uses fl_chart for visualization
}
```

---

## 🎨 Design System

### Color Palette
```dart
class AppColors {
  // Primary
  static const primary = Color(0xFFA78BFA);      // Violet
  static const primaryDark = Color(0xFF8B5CF6);
  static const primaryLight = Color(0xFFC4B5FD);
  
  // Secondary
  static const secondary = Color(0xFFF9A8D4);    // Pink
  static const secondaryDark = Color(0xFFF472B6);
  static const secondaryLight = Color(0xFFFBCFE8);
  
  // Neutrals
  static const background = Color(0xFFF7F8FA);
  static const surface = Color(0xFFFFFFFF);
  static const surfaceElevated = Color(0xFFFAFAFA);
  
  // Text
  static const textPrimary = Color(0xFF1E293B);
  static const textSecondary = Color(0xFF64748B);
  static const textTertiary = Color(0xFF94A3B8);
  
  // Status
  static const success = Color(0xFF22C55E);
  static const warning = Color(0xFFF59E0B);
  static const error = Color(0xFFEF4444);
  static const info = Color(0xFF3B82F6);
  
  // Category Colors
  static const incomeColor = Color(0xFF10B981);
  static const billsColor = Color(0xFF8B5CF6);
  static const expensesColor = Color(0xFFF59E0B);
  static const debtColor = Color(0xFFEF4444);
  static const savingsColor = Color(0xFF3B82F6);
}
```

### Typography
```dart
class AppTextStyles {
  static const String fontFamily = 'SF Pro'; // iOS default
  
  // Display
  static const displayLarge = TextStyle(
    fontSize: 32, fontWeight: FontWeight.bold, height: 1.2,
  );
  
  // Headings
  static const h1 = TextStyle(fontSize: 28, fontWeight: FontWeight.bold);
  static const h2 = TextStyle(fontSize: 24, fontWeight: FontWeight.w600);
  static const h3 = TextStyle(fontSize: 20, fontWeight: FontWeight.w600);
  
  // Body
  static const bodyLarge = TextStyle(fontSize: 16, height: 1.5);
  static const bodyMedium = TextStyle(fontSize: 14, height: 1.5);
  static const bodySmall = TextStyle(fontSize: 12, height: 1.4);
  
  // Special
  static const caption = TextStyle(fontSize: 12, color: AppColors.textSecondary);
  static const overline = TextStyle(fontSize: 10, letterSpacing: 1.5);
  static const kpiAmount = TextStyle(fontSize: 36, fontWeight: FontWeight.bold);
}
```

### Spacing & Dimensions
```dart
class AppDimensions {
  // Padding
  static const paddingXS = 4.0;
  static const paddingS = 8.0;
  static const paddingM = 16.0;
  static const paddingL = 24.0;
  static const paddingXL = 32.0;
  
  // Border Radius
  static const radiusS = 8.0;
  static const radiusM = 12.0;
  static const radiusL = 16.0;
  static const radiusXL = 24.0;
  
  // Card elevation
  static const elevationS = 2.0;
  static const elevationM = 4.0;
  static const elevationL = 8.0;
  
  // Icon sizes
  static const iconS = 16.0;
  static const iconM = 24.0;
  static const iconL = 32.0;
}
```

---

## ⚡ Performance Optimizations

### 1. State Management (Riverpod)
```dart
// Use AsyncNotifier for complex state
class BudgetNotifier extends AsyncNotifier<Budget> {
  @override
  Future<Budget> build() async {
    return _budgetRepository.getCurrentMonthBudget();
  }
  
  Future<void> addItem(BudgetItem item) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await _budgetRepository.addItem(item);
      return _budgetRepository.getCurrentMonthBudget();
    });
  }
}

// Provider definition
final budgetProvider = AsyncNotifierProvider<BudgetNotifier, Budget>(() {
  return BudgetNotifier();
});
```

### 2. Firestore Optimizations
- **Indexed queries**: Index on `userId` + `month`
- **Pagination**: Limit initial load to 10 items per category
- **Caching**: Use Firestore offline persistence
- **Batch writes**: Group multiple updates
- **Listen selectively**: Only subscribe to current month

### 3. Widget Optimizations
```dart
// Use const constructors
const AppButton(label: 'Save');

// Selective rebuilds with ConsumerWidget
class BudgetItem extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Only rebuilds when specific item changes
    final item = ref.watch(budgetItemProvider(itemId));
    return ...;
  }
}

// ListView.builder for long lists
ListView.builder(
  itemCount: items.length,
  itemBuilder: (context, index) => BudgetItemRow(items[index]),
);

// Dispose controllers
@override
void dispose() {
  _controller.dispose();
  super.dispose();
}
```

### 4. Memory Management
- Use `AutoDispose` for providers not always needed
- Implement proper image caching
- Clear old month data from memory after 3 months
- Use `ListView.builder` instead of `ListView` for large lists
- Lazy load charts (only when visible)

---

## 🧪 Testing Requirements

### Unit Tests
- All business logic in usecases
- Repository implementations
- Data model conversions
- Calculation functions (totals, progress, insights)

### Widget Tests
- All atomic widgets (buttons, text fields)
- Dialog interactions
- Form validations

### Integration Tests
- Complete user flows:
  - Sign up → Create budget → Add items → View analytics
  - Edit item → Delete item → Export report
- Firestore interactions
- State management flows

---

## 📦 Dependencies

```yaml
dependencies:
  flutter:
    sdk: flutter
  
  # State Management
  flutter_riverpod: ^2.4.0
  riverpod_annotation: ^2.3.0
  
  # Firebase
  firebase_core: ^2.24.0
  cloud_firestore: ^4.13.0
  firebase_auth: ^4.15.0
  
  # Code Generation
  freezed_annotation: ^2.4.1
  json_annotation: ^4.8.1
  
  # Routing
  go_router: ^13.0.0
  
  # Charts
  fl_chart: ^0.66.0
  
  # UI
  flutter_svg: ^2.0.9
  cached_network_image: ^3.3.0
  shimmer: ^3.0.0
  
  # Utils
  intl: ^0.18.1
  collection: ^1.18.0
  uuid: ^4.3.0
  
  # Local Storage
  hive_flutter: ^1.1.0
  shared_preferences: ^2.2.2

dev_dependencies:
  flutter_test:
    sdk: flutter
  flutter_lints: ^3.0.0
  
  # Code Generation
  build_runner: ^2.4.7
  freezed: ^2.4.6
  json_serializable: ^6.7.1
  riverpod_generator: ^2.3.0
  
  # Testing
  mockito: ^5.4.4
  integration_test:
    sdk: flutter
```

---

## 🚀 Implementation Phases

### Phase 1: Foundation (Week 1)
- ✅ Setup Flutter project with folder structure
- ✅ Configure Firebase
- ✅ Implement authentication
- ✅ Create design system (colors, typography, theme)
- ✅ Build atomic widgets (buttons, text fields, cards)

### Phase 2: Core Features (Week 2)
- ✅ Home dashboard with KPI cards
- ✅ Add/Edit budget items
- ✅ Categories screen with tables
- ✅ Firestore integration
- ✅ Basic calculations (totals, progress)

### Phase 3: Analytics (Week 3)
- ✅ Implement charts (donut, bar, line)
- ✅ History screen with month list
- ✅ Generate basic insights
- ✅ Export functionality

### Phase 4: Polish (Week 4)
- ✅ Add animations and transitions
- ✅ Error handling and loading states
- ✅ Offline support
- ✅ Performance optimization
- ✅ Testing

### Phase 5: iOS Release
- ✅ App Store setup
- ✅ Screenshots and metadata
- ✅ TestFlight beta
- ✅ Production release

### Phase 6: Android Port (Future)
- Adapt platform-specific UI elements
- Test on Android devices
- Play Store release

---

## 🎯 Success Criteria

**Functional**:
- ✅ User can track monthly budgets across all categories
- ✅ Real-time sync with Firestore
- ✅ Accurate calculations and insights
- ✅ Smooth navigation and interactions

**Technical**:
- ✅ <100ms UI response time
- ✅ <2s app startup time
- ✅ <50MB memory footprint
- ✅ 60fps scrolling and animations
- ✅ Works offline (cached data)

**Code Quality**:
- ✅ 80%+ test coverage
- ✅ No linting errors
- ✅ Clean architecture maintained
- ✅ Reusable components library
- ✅ Comprehensive documentation

---

## 📝 Final Agent Prompt

**Copy this for the coding agent:**

---

Build a production-grade Flutter iOS app called **"Financial Planner Pro"** with the following specifications:

**Core Functionality**: Monthly budget tracker with income, bills, expenses, debt, and savings categories. Real-time Firebase Firestore sync, visual analytics, historical insights, and export capabilities.

**Architecture**: Clean architecture (data/domain/presentation layers) + Atomic Design (atoms/molecules/organisms) + Riverpod state management. Immutable state with freezed. Repository pattern for data access.

**App Structure**:
- **Home Screen**: Month selector, 3 KPI cards (Income/Spent/Available), quick action buttons, donut chart, bar chart, summary table
- **Categories Screen**: Tabbed view (Income/Bills/Expenses/Debt/Savings), each showing editable table with planned/actual/progress, swipe-to-delete, tap-to-edit
- **History Screen**: Month timeline cards, line/bar/pie charts, AI-generated insights, export options

**Data Model**: Firestore path `/users/{userId}/budgets/{monthId}/categories/{categoryId}/items/{itemId}`. Store planned vs actual amounts, calculate totals, progress %, savings rate. Implement offline caching.

**UI Design**: Pastel theme (violet #A78BFA primary, pink #F9A8D4 secondary, white surfaces), rounded cards (12-16px radius), soft shadows, SF Pro typography, generous spacing. iOS-first design patterns.

**Performance**: Use Riverpod AsyncNotifier, const widgets, ListView.builder, Firestore offline persistence, selective stream subscriptions, <100ms UI response, 60fps animations, <50MB memory.

**File Structure**: Organize as core/ (config, theme, constants), data/ (models, repositories, datasources), domain/ (entities, usecases), presentation/ (screens, widgets subdivided into atoms/molecules/organisms, dialogs), providers/. Implement freezed models, dependency injection, proper error handling.

**Deliverables**: Complete working app with authentication, all screens functional, chart visualizations (fl_chart), 80%+ test coverage, comprehensive widget library, Firebase configured, clean documented code, easy Android portability.

**Constraints**: iOS-first, offline-capable, accessible, secure Firestore rules, production-ready.
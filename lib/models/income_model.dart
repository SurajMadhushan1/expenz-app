import 'dart:ui';

enum IncomeCategory { freelance, salary, passive, sales, other }

//category Images

final Map<IncomeCategory, String> categoryImages = {
  IncomeCategory.freelance: 'assets/images/freelance.png',
  IncomeCategory.salary: 'assets/images/salary.png',
  IncomeCategory.passive: 'assets/images/passive.png',
  IncomeCategory.sales: 'assets/images/sales.png',
  IncomeCategory.other: 'assets/images/other.png',
};
//category colors

final Map<IncomeCategory, Color> categoryColors = {
  IncomeCategory.freelance: const Color(0xFF4CAF50),
  IncomeCategory.salary: const Color(0xFF2196F3),
  IncomeCategory.passive: const Color(0xFFFF9800),
  IncomeCategory.sales: const Color(0xFFF44336),
  IncomeCategory.other: const Color(0xFF9E9E9E),
};

class IncomeModel {
  final String id;
  final String name;
  final double amount;
  final DateTime date;
  final DateTime time;
  final IncomeCategory category;
  final String description;

  IncomeModel({
    required this.time,
    required this.description,
    required this.id,
    required this.name,
    required this.amount,
    required this.date,
    required this.category,
  });
}

import 'dart:ui';

enum ExpenseCategory { shopping, subscriptions, food, health, transport }

//catefory images
final Map<ExpenseCategory, String> categoryImages = {
  ExpenseCategory.shopping: 'assets/images/shopping.png',
  ExpenseCategory.subscriptions: 'assets/images/subscriptions.png',
  ExpenseCategory.food: 'assets/images/food.png',
  ExpenseCategory.health: 'assets/images/health.png',
  ExpenseCategory.transport: 'assets/images/transport.png',
};
//category colors
final Map<ExpenseCategory, Color> categoryColors = {
  ExpenseCategory.shopping: const Color(0xFF4CAF50),
  ExpenseCategory.subscriptions: const Color(0xFF2196F3),
  ExpenseCategory.food: const Color(0xFFFF9800),
  ExpenseCategory.health: const Color(0xFFF44336),
  ExpenseCategory.transport: const Color(0xFF9E9E9E),
};

class ExpenseModel {
  final String id;
  final String name;
  final double amount;
  final DateTime date;
  final DateTime time;
  final String description;
  final ExpenseCategory category;

  ExpenseModel({
    required this.id,
    required this.name,
    required this.amount,
    required this.date,
    required this.time,
    required this.description,
    required this.category,
  });

  //creating to json

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'amount': amount,
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'description': description,
      'category': category.index,
    };
  }

  //creating from json

  factory ExpenseModel.fromJson(Map<String, dynamic> data) {
    return ExpenseModel(
      id: data['id'],
      name: data['name'],
      amount: data['amount'],
      date: DateTime.parse(data['date']),
      time: DateTime.parse(data['time']),
      description: data['description'],
      category: ExpenseCategory.values[data['category']],
    );
  }
}

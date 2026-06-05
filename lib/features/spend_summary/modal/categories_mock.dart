

class CategoryModel {
  final String name;
  final String icon;
  final double amount;

  const CategoryModel({
    required this.name,
    required this.icon,
    required this.amount,
  });
}

//===============================================================

final List<CategoryModel> categories = [
  const CategoryModel(
    name: 'Food',
    icon: '🍔',
    amount: 4500,
  ),
  const CategoryModel(
    name: 'Travel',
    icon: '✈️',
    amount: 3200,
  ),
  const CategoryModel(
    name: 'Shopping',
    icon: '🛒',
    amount: 6800,
  ),
  const CategoryModel(
    name: 'Bills',
    icon: '⚡',
    amount: 2400,
  ),
  const CategoryModel(
    name: 'Entertainment',
    icon: '🎬',
    amount: 5200,
  ),
];
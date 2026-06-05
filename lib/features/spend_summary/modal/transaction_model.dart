class TransactionModel {
  final String title;
  final String category;
  final String date;
  final double amount;

  const TransactionModel({
    required this.title,
    required this.category,
    required this.date,
    required this.amount,
  });
}

//===================================================
final List<TransactionModel> transactions =
List.generate(
  57,
      (index) => TransactionModel(
    title: 'Transaction ${index + 1}',
    category: [
      'Food',
      'Travel',
      'Shopping',
      'Bills',
      'Entertainment'
    ][index % 5],
    date: '12 Jun 2026',
    amount: 100 + (index * 25).toDouble(),
  ),
);


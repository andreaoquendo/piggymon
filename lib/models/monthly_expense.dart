class MonthlyExpense {
  final int id;
  final int accountId;
  final bool isExpense;
  final int day;
  final String name;
  final num quantity;
  final String categoria;

  const MonthlyExpense({
    this.id = -1,
    required this.accountId,
    required this.isExpense,
    required this.day,
    required this.name,
    required this.quantity,
    this.categoria = ' '
  });

}
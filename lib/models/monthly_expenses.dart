class MonthlyExpense {
  final int id;
  final int day;
  final String name;
  final num quantity;

  const MonthlyExpense({
    this.id = -1,
    required this.day,
    required this.name,
    required this.quantity,
  });

}
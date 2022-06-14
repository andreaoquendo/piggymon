class Transaction {
  final int id;
  final int idTransac;
  final String category;
  final num value;
  final bool isExpense;

  const Transaction({
    this.id = -1,
    this.idTransac = -1,
    this.category = 'none',
    required this.value,
    required this.isExpense,
  });

}
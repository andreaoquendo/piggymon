class Transaction {
  final int idTransac;
  final int accountId;
  final String category;
  final num value;
  final bool isExpense;

  const Transaction({
    this.idTransac = -1,
    required this.accountId,
    this.category = 'none',
    required this.value,
    required this.isExpense,
  });

}
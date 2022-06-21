class CreditInfo {
  int accountId;
  num totalAvailable;
  num outcomes;
  num incomes;
  num savingsGoal;

  CreditInfo({
    required this.accountId,
    this.totalAvailable = 0,
    this.outcomes = 0,
    this.incomes = 0,
    this.savingsGoal = 0
  });

}
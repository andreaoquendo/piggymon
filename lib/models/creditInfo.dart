final String tableCredit = 'creditInfo';

class CreditFields {
  static final List<String> values = [
    accountId, totalAvailable, outcomes, incomes, savingsGoal
  ];

  static final String accountId = "_accountId";
  static final String totalAvailable = "totalAvailable";
  static final String outcomes = 'outcomes';
  static final String incomes = "incomes";
  static final String savingsGoal = "savingsGoal";
}

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

  CreditInfo copy({
    int? accountId,
    num? totalAvailable,
    num? outcomes,
    num? incomes,
    num? savingsGoal,
  }) => CreditInfo(
      accountId: accountId ?? this.accountId,
      totalAvailable: totalAvailable ?? this.totalAvailable,
      outcomes: outcomes ?? this.outcomes,
      incomes: incomes ?? this.incomes,
      savingsGoal: savingsGoal ?? this.savingsGoal
  );

  Map<String, Object?> toJson() => {
    CreditFields.accountId: accountId,
    CreditFields.totalAvailable: totalAvailable,
    CreditFields.incomes: incomes,
    CreditFields.outcomes: outcomes,
    CreditFields.savingsGoal: savingsGoal
  };

  static CreditInfo fromJson(Map<String, Object?> json) => CreditInfo(
      accountId: json[CreditFields.accountId] as int,
      totalAvailable: json[CreditFields.totalAvailable] as num,
      outcomes: json[CreditFields.outcomes] as num,
      incomes: json[CreditFields.incomes] as num,
      savingsGoal: json[CreditFields.savingsGoal] as num
  );

}
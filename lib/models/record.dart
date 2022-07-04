final String tableRecord = 'records';

class RecordFields{

  static final List<String> values = [
    idTransac, accountId, category, value, isExpense
  ];

  static final String idTransac = '_idTransac';
  static final String accountId = '_accountId';
  static final String category = 'category';
  static final String value = 'value';
  static final String isExpense = 'isExpense';
}

class Record {
  final int? idTransac;
  final int accountId;
  final String category;
  final num value;
  final bool isExpense;

  const Record({
    this.idTransac,
    required this.accountId,
    this.category = 'none',
    required this.value,
    required this.isExpense,
  });

  Record copy({
    int? idTransac,
    int? accountId,
    String? category,
    num? value,
    bool? isExpense
  }) =>
      Record(
          idTransac: idTransac ?? this.idTransac,
          accountId: accountId ?? this.accountId,
          category: category ?? this.category,
          value: value ?? this.value,
          isExpense: isExpense ?? this.isExpense
      );

  static Record fromJson(Map<String, Object?> json) => Record(
      idTransac: json[RecordFields.idTransac] as int,
      accountId: json[RecordFields.accountId] as int,
      category: json[RecordFields.category] as String,
      value: json[RecordFields.value] as num,
      isExpense: json[RecordFields.isExpense] == 1
  );

  Map<String, Object?> toJson() => {
    RecordFields.idTransac: idTransac,
    RecordFields.accountId: accountId,
    RecordFields.category: category,
    RecordFields.value: value,
    RecordFields.isExpense: isExpense ? 1 : 0
  };

}
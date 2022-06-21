import 'package:piggymon/models/monthly_expense.dart';

const DUMMY_MONTHLY_EXPENSES = {
  1: const MonthlyExpense(id: 1, accountId: 1, day: 14, isExpense: true, name: 'Internet', quantity: 155.50,),
  2: const MonthlyExpense(id: 2, accountId:1, day: 5, name: 'Agua', isExpense: true, quantity: 85.90,),
  3: const MonthlyExpense(id: 3, accountId: 2, day: 4, name: 'Celular', isExpense: false, quantity: 40.00,),
};
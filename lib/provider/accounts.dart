import 'dart:math';

import 'package:flutter/material.dart';
import 'package:piggymon/data/dummy_users.dart';
import 'package:piggymon/db/database.dart';
import 'package:piggymon/models/account.dart';
<<<<<<< HEAD
import 'package:piggymon/models/creditInfo.dart';

class Accounts with ChangeNotifier{
  Future<Map<int, Account>> _itemsDB = PiggymonDatabase.instance.readAllAccounts();

  Future<int> get count async {
    return await _itemsDB.then((value) => value.length);
  }


  void put(Account account, num savingsGoal) async {
    Account ac = await PiggymonDatabase.instance.createAccount(account);
    await PiggymonDatabase.instance.createCreditInfo(
      CreditInfo(
        accountId: ac.id!,
        savingsGoal: savingsGoal
      )
    );
  }

}

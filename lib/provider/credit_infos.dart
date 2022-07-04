
import 'package:flutter/material.dart';
import 'package:piggymon/db/database.dart';
import 'package:piggymon/models/creditInfo.dart';

class CreditInfos with ChangeNotifier{

  Future<CreditInfo> getCreditInfo(int accountId) async {
    return await PiggymonDatabase.instance.readCreditInfo(accountId);
  }

}
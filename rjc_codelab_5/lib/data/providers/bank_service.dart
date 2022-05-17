import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rjc_codelab_5/data/models/account_model.dart';
import 'package:rjc_codelab_5/data/providers/deposit_service.dart';
import 'package:rjc_codelab_5/data/providers/login_service.dart';

class FlutterBankService extends ChangeNotifier {
  Account? selectedAccount;

  Account? get getSelectedAccount => selectedAccount;

  void setSelectedAccount(Account account) {
    selectedAccount = account;
    notifyListeners();
  }

  Future<List<Account>> getAccounts(BuildContext context) {
    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    String userId = loginService.getUserId;

    List<Account> accounts = [];

    Completer<List<Account>> accountsCompleter = Completer();

    FirebaseFirestore.instance
        .collection('accounts')
        .doc(userId)
        .collection('user_accounts')
        .get()
        .then(
      (snapshot) {
        for (var doc in snapshot.docs) {
          Account account = Account.fromJson(doc.data(), doc.id);
          accounts.add(account);
        }

        Future.delayed(const Duration(seconds: 1), () {
          accountsCompleter.complete(accounts);
        });
      },
      onError: (error) {
        accountsCompleter.completeError({'error': error});
      },
    );

    return accountsCompleter.future;
  }

  Future<bool> performDeposit(BuildContext context) {
    Completer<bool> depositComplete = Completer();

    LoginService loginService =
        Provider.of<LoginService>(context, listen: false);
    String userId = loginService.getUserId;

    DepositService depositService =
        Provider.of<DepositService>(context, listen: false);
    int amountToDeposit = depositService.amountToDeposit.toInt();

    DocumentReference doc = FirebaseFirestore.instance
        .collection('accounts')
        .doc(userId)
        .collection('user_accounts')
        .doc(selectedAccount!.id!);

    doc.update(
      {
        'balance': selectedAccount!.balance! + amountToDeposit,
      },
    ).then(
      (value) {
        depositService.resetDepositService();
        depositComplete.complete(true);
      },
      onError: (error) {
        depositComplete.completeError({'error': error});
      },
    );

    return depositComplete.future;
  }
}

import 'package:flutter/cupertino.dart';

class DepositService extends ChangeNotifier {
  double amountToDeposit = 0;

  void setAmountToDeposit(double amount) {
    amountToDeposit = amount;
    notifyListeners();
  }

  void resetDepositService() {
    amountToDeposit = 0;
    notifyListeners();
  }

  bool checkAmountToDeposit() {
    return amountToDeposit > 0;
  }
}

import 'package:flutter/material.dart';
import 'package:rjc_codelab_5/data/models/bottom_bar_model.dart';

abstract class FlutterBankBottomBarRepo {
  static List<FlutterBankBottomBarModel> getBottomBarItems() {
    return [
      FlutterBankBottomBarModel(
        label: 'Withdraw',
        icon: Icons.logout_rounded,
        action: () {},
      ),
      FlutterBankBottomBarModel(
        label: 'Deposit',
        icon: Icons.login_rounded,
        action: () {},
      ),
      FlutterBankBottomBarModel(
        label: 'Expenses',
        icon: Icons.payment_rounded,
        action: () {},
      ),
    ];
  }
}

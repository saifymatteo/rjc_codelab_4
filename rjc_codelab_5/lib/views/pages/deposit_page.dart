import 'package:flutter/material.dart';
import 'package:rjc_codelab_5/constants/constants.dart';
import 'package:rjc_codelab_5/views/components/account_action_header.dart';
import 'package:rjc_codelab_5/views/components/account_action_selection.dart';

class FlutterBankDepositPage extends StatelessWidget {
  const FlutterBankDepositPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: const IconThemeData(color: AppColor.mainThemeColor),
        backgroundColor: Colors.transparent,
        title: const Icon(AppIcon.mainIcon, size: 40),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: const [
            AccountActionHeader(
              title: 'Deposit',
              icon: Icons.login_rounded,
            ),
            Expanded(
              child: AccountActionSelection(),
            ),
          ],
        ),
      ),
    );
  }
}

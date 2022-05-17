import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rjc_codelab_5/data/models/account_model.dart';
import 'package:rjc_codelab_5/data/providers/bank_service.dart';
import 'package:rjc_codelab_5/views/components/error.dart';
import 'package:rjc_codelab_5/views/components/loading.dart';

class AccountActionSelection extends StatelessWidget {
  const AccountActionSelection({
    Key? key,
    this.actionTypeLabel,
  }) : super(key: key);

  final String? actionTypeLabel;

  @override
  Widget build(BuildContext context) {
    return Consumer<FlutterBankService>(
      builder: (context, provider, __) {
        return FutureBuilder(
          // Pass in context to get Provider.of(context)
          future: provider.getAccounts(context),
          builder: (_, snapshot) {
            if (!snapshot.hasData) {
              return const FlutterBankLoading();
            }

            if (snapshot.hasError) {
              return const FlutterBankError();
            }

            Account selectedAccount = provider.getSelectedAccount!;
            List<Account> accounts = snapshot.data as List<Account>;

            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  actionTypeLabel!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                const SizedBox(height: 10),
              ],
            );
          },
        );
      },
    );
  }
}

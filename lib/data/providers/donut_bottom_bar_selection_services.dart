import 'package:flutter/material.dart';
import 'package:rjc_codelab_4/views/routes/app_routes.dart';
import 'package:rjc_codelab_4/views/routes/global_key.dart';

class DonutBottomBarSelectionService extends ChangeNotifier {
  String? tabSelection = AppRouteName.main;

  void setTabSelection(String selection) {
    AppGlobalKey.mainListNav.currentState!.pushReplacementNamed(selection);
    tabSelection = selection;
    notifyListeners();
  }
}

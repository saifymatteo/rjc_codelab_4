import 'package:flutter/material.dart';

abstract class AppGlobalKey {
  static GlobalKey<NavigatorState> mainListNav = GlobalKey();
  static GlobalKey<NavigatorState> mainAppNav = GlobalKey();
}

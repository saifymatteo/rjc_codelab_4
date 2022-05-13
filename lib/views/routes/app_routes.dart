import 'package:flutter/material.dart';
import 'package:rjc_codelab_4/views/pages/donut_main_page.dart';

import '../components/donut_shop_main.dart';
import '../pages/splash_page.dart';

abstract class AppRouteName {
  static const String index = '/';
  static const String main = '/main';
  static const String favorites = '/favorites';
  static const String shoppingCart = '/shoppingcart';
}

abstract class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRouteName.index: (_) => const SplashPage(),
    AppRouteName.main: (_) => const DonutShopMain(),
  };

  static Route<dynamic>? Function(RouteSettings)? appGenerateRoute =
      (RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case AppRouteName.main:
        page = const DonutMainPage();
        break;
      case AppRouteName.favorites:
        page = const Center(
          child: Text('favorites'),
        );
        break;
      case AppRouteName.shoppingCart:
        page = const Center(
          child: Text('shopping cart'),
        );
        break;
      default:
        page = const DonutMainPage();
        break;
    }

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: const Duration(seconds: 0),
    );
  };
}

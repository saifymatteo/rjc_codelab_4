import 'package:flutter/material.dart';
import 'package:rjc_codelab_4/views/pages/donut_favorites_page.dart';
import 'package:rjc_codelab_4/views/pages/donut_shop_details_page.dart';
import 'package:rjc_codelab_4/views/pages/donut_main_page.dart';
import 'package:rjc_codelab_4/views/pages/donut_shopping_cart_page.dart';

import '../components/donut_shop_main.dart';
import '../pages/splash_page.dart';

abstract class AppRouteName {
  static const String index = '/';
  static const String main = '/main';
  static const String details = '/details';
  static const String favorites = '/favorites';
  static const String shoppingCart = '/shoppingcart';
}

abstract class AppRoutes {
  static Map<String, Widget Function(BuildContext)> routes = {
    AppRouteName.index: (_) => const SplashPage(),
    AppRouteName.main: (_) => const DonutShopMain(),
    AppRouteName.details: (_) => const DonutShopDetailsPage(),
    AppRouteName.favorites: (_) => const DonutFavoritesPage(),
    AppRouteName.shoppingCart: (_) => const DonutShoppingCartPage(),
  };

  static Route<dynamic>? Function(RouteSettings)? appGenerateRoute =
      (RouteSettings settings) {
    Widget page;

    switch (settings.name) {
      case AppRouteName.main:
        page = const DonutMainPage();
        break;
      case AppRouteName.favorites:
        page = const DonutFavoritesPage();
        break;
      case AppRouteName.shoppingCart:
        page = const DonutShoppingCartPage();
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

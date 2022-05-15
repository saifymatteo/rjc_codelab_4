import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rjc_codelab_4/data/providers/donut_service.dart';
import 'package:rjc_codelab_4/data/providers/donut_shopping_cart_service.dart';
import 'package:rjc_codelab_4/views/routes/app_routes.dart';
import 'package:rjc_codelab_4/views/routes/global_key.dart';

import 'data/providers/donut_bottom_bar_selection_services.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DonutBottomBarSelectionService()),
        ChangeNotifierProvider(create: (_) => DonutService()),
        ChangeNotifierProvider(create: (_) => DonutShoppingCartService()),
      ],
      child: MaterialApp(
        initialRoute: AppRouteName.index,
        navigatorKey: AppGlobalKey.mainAppNav,
        routes: AppRoutes.routes,
      ),
    ),
  );
}

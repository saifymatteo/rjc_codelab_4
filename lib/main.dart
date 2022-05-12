import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rjc_codelab_4/providers/donut_bottom_bar_selection_services.dart';
import 'package:rjc_codelab_4/views/routes/app_routes.dart';
import 'package:rjc_codelab_4/views/routes/global_key.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => DonutBottomBarSelectionService(),
        ),
      ],
      child: MaterialApp(
        initialRoute: AppRouteName.index,
        navigatorKey: AppGlobalKey.mainAppNav,
        routes: AppRoutes.routes,
      ),
    ),
  );
}

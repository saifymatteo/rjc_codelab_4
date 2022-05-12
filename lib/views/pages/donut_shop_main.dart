import 'package:flutter/material.dart';
import 'package:rjc_codelab_4/views/components/donut_bottom_bar.dart';
import 'package:rjc_codelab_4/views/components/donut_side_menu.dart';
import 'package:rjc_codelab_4/views/routes/app_routes.dart';
import 'package:rjc_codelab_4/views/routes/global_key.dart';

import '../../constants/constants.dart';

class DonutShopMain extends StatelessWidget {
  const DonutShopMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.mainDark),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Image.network(
          AppImage.donutLogoRedText,
          width: 120,
        ),
      ),
      drawer: const Drawer(child: DonutSideMenu()),
      body: Column(
        children: [
          Expanded(
            child: Navigator(
              key: AppGlobalKey.mainListNav,
              initialRoute: AppRouteName.main,
              onGenerateRoute: AppRoutes.appGenerateRoute
            ),
          ),
          const DonutBottomBar(),
        ],
      ),
    );
  }
}

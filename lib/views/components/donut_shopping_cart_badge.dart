import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rjc_codelab_4/constants/colors.dart';
import 'package:rjc_codelab_4/data/providers/donut_bottom_bar_selection_services.dart';
import 'package:rjc_codelab_4/data/providers/donut_shopping_cart_service.dart';

import '../routes/app_routes.dart';

class DonutShoppingCartBadge extends StatelessWidget {
  const DonutShoppingCartBadge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer2(
      builder: (_, DonutShoppingCartService cartService,
          DonutBottomBarSelectionService bottomBar, __) {
        if (cartService.cartDonuts.isEmpty) {
          return const SizedBox();
        }

        return Transform.scale(
          scale: 0.7,
          child: GestureDetector(
            onTap: () {
              bottomBar.setTabSelection(AppRouteName.shoppingCart);
              Navigator.of(context).pop();
            },
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: AppColor.mainColor,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Row(
                children: [
                  Text(
                    cartService.cartDonuts.length.toString(),
                    style: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.shopping_cart_rounded,
                    size: 25,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rjc_codelab_4/constants/constants.dart';
import 'package:rjc_codelab_4/data/providers/donut_shopping_cart_service.dart';
import 'package:rjc_codelab_4/views/routes/app_routes.dart';

import '../../data/providers/donut_bottom_bar_selection_services.dart';

class DonutBottomBar extends StatelessWidget {
  const DonutBottomBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(30, 5, 30, 20),
      child: Consumer<DonutBottomBarSelectionService>(
        builder: (_, bottomBarSelectionService, child) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  bottomBarSelectionService.setTabSelection(AppRouteName.main);
                },
                icon: Icon(
                  Icons.trip_origin_rounded,
                  color: bottomBarSelectionService.tabSelection ==
                          AppRouteName.main
                      ? AppColor.mainDark
                      : AppColor.mainColor,
                ),
              ),
              IconButton(
                onPressed: () {
                  bottomBarSelectionService
                      .setTabSelection(AppRouteName.favorites);
                },
                icon: Icon(
                  Icons.favorite_rounded,
                  color: bottomBarSelectionService.tabSelection ==
                          AppRouteName.favorites
                      ? AppColor.mainDark
                      : AppColor.mainColor,
                ),
              ),
              Consumer<DonutShoppingCartService>(
                builder: (_, provider, __) {
                  int cartItems = provider.cartDonuts.length;

                  return GestureDetector(
                    onTap: () {
                      bottomBarSelectionService
                          .setTabSelection(AppRouteName.shoppingCart);
                    },
                    child: Container(
                      constraints: const BoxConstraints(minHeight: 70),
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: cartItems > 0
                            ? (bottomBarSelectionService.tabSelection ==
                                    AppRouteName.shoppingCart
                                ? AppColor.mainDark
                                : AppColor.mainColor)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          cartItems > 0
                              ? Text(
                                  cartItems.toString(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                  ),
                                )
                              : const SizedBox(height: 17),
                          const SizedBox(height: 10),
                          Icon(
                            Icons.shopping_cart_rounded,
                            color: cartItems > 0
                                ? Colors.white
                                : (bottomBarSelectionService.tabSelection ==
                                        AppRouteName.shoppingCart
                                    ? AppColor.mainDark
                                    : AppColor.mainColor),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

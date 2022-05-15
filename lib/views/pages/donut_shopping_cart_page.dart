import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rjc_codelab_4/constants/constants.dart';
import 'package:rjc_codelab_4/data/providers/donut_shopping_cart_service.dart';
import 'package:rjc_codelab_4/views/components/donut_shopping_list.dart';

class DonutShoppingCartPage extends StatefulWidget {
  const DonutShoppingCartPage({Key? key}) : super(key: key);

  @override
  State<DonutShoppingCartPage> createState() => _DonutShoppingCartPageState();
}

class _DonutShoppingCartPageState extends State<DonutShoppingCartPage>
    with SingleTickerProviderStateMixin {
  AnimationController? titleAnimation;

  @override
  void initState() {
    titleAnimation = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..forward();
    super.initState();
  }

  @override
  void dispose() {
    titleAnimation!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: titleAnimation!, curve: Curves.easeInOut),
            ),
            child: Image.network(
              AppImage.donutTitleMyDonuts,
              width: 170,
            ),
          ),
          Expanded(
            child: Consumer<DonutShoppingCartService>(
              builder: (_, provider, __) {
                if (provider.cartDonuts.isEmpty) {
                  return Center(
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.shopping_cart_rounded,
                            color: Colors.grey[300],
                            size: 50,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'You don\'t have any items on your cart yet!',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return DonutShoppingList(
                  donutCart: provider.cartDonuts,
                );
              },
            ),
          ),
          Consumer<DonutShoppingCartService>(
            builder: (_, provider, __) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Total',
                        style: TextStyle(color: AppColor.mainDark),
                      ),
                      Text(
                        '\$${provider.getTotal().toStringAsFixed(2)}',
                        style: const TextStyle(
                          color: AppColor.mainDark,
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                        ),
                      ),
                    ],
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Material(
                      color: provider.cartDonuts.isEmpty
                          ? Colors.grey[200]
                          : AppColor.mainColor.withOpacity(0.2),
                      child: InkWell(
                        splashColor: AppColor.mainDark.withOpacity(0.2),
                        highlightColor: AppColor.mainDark.withOpacity(0.5),
                        onTap: provider.cartDonuts.isEmpty
                            ? null
                            : () {
                                provider.clearCart();
                              },
                        child: Container(
                          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.delete_forever_rounded,
                                color: provider.cartDonuts.isEmpty
                                    ? Colors.grey
                                    : AppColor.mainDark,
                              ),
                              Text(
                                'Clear Cart',
                                style: TextStyle(
                                  color: provider.cartDonuts.isEmpty
                                      ? Colors.grey
                                      : AppColor.mainDark,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rjc_codelab_4/constants/constants.dart';
import 'package:rjc_codelab_4/data/models/donut_model.dart';
import 'package:rjc_codelab_4/data/providers/donut_favorites_service.dart';
import 'package:rjc_codelab_4/data/providers/donut_service.dart';
import 'package:rjc_codelab_4/data/providers/donut_shopping_cart_service.dart';
import 'package:rjc_codelab_4/views/components/donut_shopping_cart_badge.dart';

class DonutShopDetailsPage extends StatefulWidget {
  const DonutShopDetailsPage({Key? key}) : super(key: key);

  @override
  State<DonutShopDetailsPage> createState() => _DonutShopDetailsPageState();
}

class _DonutShopDetailsPageState extends State<DonutShopDetailsPage>
    with SingleTickerProviderStateMixin {
  DonutModel? selectedDonut;
  AnimationController? controller;
  Animation<double>? rotationAnimation;

  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat();
    rotationAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: controller!, curve: Curves.linear),
    );
    super.initState();
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    DonutService donutService =
        Provider.of<DonutService>(context, listen: false);
    selectedDonut = donutService.getSelectedDonut();

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: AppColor.mainDark),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: SizedBox(
          width: 120,
          child: Image.network(AppImage.donutLogoRedText),
        ),
        actions: const [
          DonutShoppingCartBadge(),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Stack(
              children: [
                Positioned(
                  top: -40,
                  right: -120,
                  child: RotationTransition(
                    turns: rotationAnimation!,
                    child: Hero(
                      tag: selectedDonut!.name!,
                      child: Image.network(
                        selectedDonut!.imgUrl!,
                        width: MediaQuery.of(context).size.width * 1.25,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          selectedDonut!.name!,
                          style: const TextStyle(
                            color: AppColor.mainDark,
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const SizedBox(width: 50),
                      Consumer<DonutFavoritesService>(
                        builder: (_, provider, __) {
                          return IconButton(
                            onPressed: () {
                              if (provider.isDonutInFavorites(selectedDonut!)) {
                                provider.removeFromFavorites(selectedDonut!);
                              } else {
                                provider.addToFavorites(selectedDonut!);
                              }
                            },
                            icon: provider.isDonutInFavorites(selectedDonut!)
                                ? const Icon(Icons.favorite_rounded)
                                : const Icon(Icons.favorite_outline_rounded),
                            color: AppColor.mainDark,
                          );
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                    decoration: BoxDecoration(
                      color: AppColor.mainDark,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '\$${selectedDonut!.price!.toStringAsFixed(2)}',
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(selectedDonut!.description!),
                  Consumer<DonutShoppingCartService>(
                    builder: (_, provider, __) {
                      if (!provider.isDonutInCart(selectedDonut!)) {
                        return GestureDetector(
                          onTap: () {
                            provider.addToCart(selectedDonut!);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 20),
                            alignment: Alignment.center,
                            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                            decoration: BoxDecoration(
                              color: AppColor.mainDark.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.shopping_cart_rounded,
                                  color: AppColor.mainDark,
                                ),
                                SizedBox(width: 20),
                                Text(
                                  'Add To Cart',
                                  style: TextStyle(color: AppColor.mainDark),
                                ),
                              ],
                            ),
                          ),
                        );
                      }

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 25),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.check_rounded,
                                  color: AppColor.mainDark,
                                ),
                                SizedBox(width: 20),
                                Text(
                                  'Added to Cart',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: AppColor.mainDark,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  provider.removeFromCart(selectedDonut!);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 40,
                                  height: 40,
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  decoration: BoxDecoration(
                                    color: AppColor.mainDark.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(
                                    Icons.remove_rounded,
                                    color: AppColor.mainColor,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Container(
                                alignment: Alignment.center,
                                width: 40,
                                height: 40,
                                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                decoration: BoxDecoration(
                                  color: AppColor.mainDark.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child:
                                    Text(provider.cartDonuts.length.toString()),
                              ),
                              const SizedBox(width: 10),
                              GestureDetector(
                                onTap: () {
                                  provider.addToCart(selectedDonut!);
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  width: 40,
                                  height: 40,
                                  padding:
                                      const EdgeInsets.fromLTRB(5, 5, 5, 5),
                                  decoration: BoxDecoration(
                                    color: AppColor.mainDark.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: const Icon(
                                    Icons.add_rounded,
                                    color: AppColor.mainColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rjc_codelab_4/data/providers/donut_favorites_service.dart';

import '../../constants/constants.dart';
import '../components/donut_shopping_list.dart';

class DonutFavoritesPage extends StatefulWidget {
  const DonutFavoritesPage({Key? key}) : super(key: key);

  @override
  State<DonutFavoritesPage> createState() => _DonutFavoritesPageState();
}

class _DonutFavoritesPageState extends State<DonutFavoritesPage> with SingleTickerProviderStateMixin {
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
            child: Consumer<DonutFavoritesService>(
              builder: (_, provider, __) {
                if (provider.favDonuts.isEmpty) {
                  return Center(
                    child: SizedBox(
                      width: 200,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.favorite_rounded,
                            color: Colors.grey[300],
                            size: 50,
                          ),
                          const SizedBox(height: 20),
                          const Text(
                            'You don\'t have any items on your favorites yet!',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return DonutShoppingList(
                  donutCart: provider.favDonuts,
                  isShoppingList: false,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
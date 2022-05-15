import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rjc_codelab_4/constants/colors.dart';
import 'package:rjc_codelab_4/data/models/donut_model.dart';
import 'package:rjc_codelab_4/data/providers/donut_shopping_cart_service.dart';

class DonutShoppingListRow extends StatelessWidget {
  const DonutShoppingListRow({Key? key, this.donut}) : super(key: key);

  final DonutModel? donut;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 20, 10),
      child: Row(
        children: [
          Image.network(
            donut!.imgUrl!,
            width: 80,
            height: 80,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  donut!.name!,
                  style: const TextStyle(
                    color: AppColor.mainDark,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 2,
                      color: AppColor.mainDark.withOpacity(0.2),
                    ),
                  ),
                  child: Text(
                    '\$${donut!.price!.toStringAsFixed(2)}',
                    style: TextStyle(
                      color: AppColor.mainDark.withOpacity(0.4),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Consumer<DonutShoppingCartService>(
            builder: (context, provider, child) {
              return IconButton(
                onPressed: () {
                  provider.removeFromCart(donut!);
                },
                icon: const Icon(
                  Icons.delete_forever_rounded,
                  color: AppColor.mainColor,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

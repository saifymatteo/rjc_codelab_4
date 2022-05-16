import 'package:flutter/material.dart';
import 'package:rjc_codelab_4/data/models/donut_model.dart';

class DonutShoppingCartService extends ChangeNotifier {
  List<DonutModel> cartDonuts = [];

  void addToCart(DonutModel donut) {
    cartDonuts.add(donut);
    notifyListeners();
  }

  void removeFromCart(DonutModel donut) {
    cartDonuts.remove(donut);
    notifyListeners();
  }

  void clearCart() {
    cartDonuts.clear();
    notifyListeners();
  }

  double getTotal() {
    double cartTotal = 0.0;
    for (var i in cartDonuts) {
      cartTotal = cartTotal + i.price!;
    }
    return cartTotal;
  }

  bool isDonutInCart(DonutModel donut) {
    return cartDonuts.any((element) => element.name == donut.name);
  }
}

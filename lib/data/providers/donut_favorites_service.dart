import 'package:flutter/cupertino.dart';

import '../models/donut_model.dart';

class DonutFavoritesService extends ChangeNotifier {
  List<DonutModel> favDonuts = [];

  void addToFavorites(DonutModel donut) {
    favDonuts.add(donut);
    notifyListeners();
  }

  void removeFromFavorites(DonutModel donut) {
    favDonuts.removeWhere((element) => element.name == donut.name);
    notifyListeners();
  }

  bool isDonutInFavorites(DonutModel donut) {
    return favDonuts.any((element) => element.name == donut.name);
  }
}
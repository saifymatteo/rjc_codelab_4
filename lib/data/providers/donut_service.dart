import 'package:flutter/material.dart';
import 'package:rjc_codelab_4/data/models/donut_model.dart';
import 'package:rjc_codelab_4/data/repositories/donut_filter_bar_repo.dart';
import 'package:rjc_codelab_4/data/repositories/donut_repo.dart';
import 'package:rjc_codelab_4/views/routes/app_routes.dart';
import 'package:rjc_codelab_4/views/routes/global_key.dart';

class DonutService extends ChangeNotifier {
  String? selectedDonutType;
  List<DonutModel> filteredDonuts = [];
  late DonutModel selectedDonut;

  DonutService() {
    selectedDonutType = DonutFilterBarRepo.filterBarItems.first.id;
    filteredDonutsByType(selectedDonutType!);
  }

  DonutModel getSelectedDonut() {
    return selectedDonut;
  }

  void filteredDonutsByType(String type) {
    selectedDonutType = type;
    filteredDonuts = DonutRepo.donuts
        .where((item) => item.type == selectedDonutType)
        .toList();
    notifyListeners();
  }

  void onDonutSelected(DonutModel donut) {
    selectedDonut = donut;
    AppGlobalKey.mainAppNav.currentState!.pushNamed(AppRouteName.details);
  }
}

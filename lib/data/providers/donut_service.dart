import 'package:flutter/material.dart';
import 'package:rjc_codelab_4/data/models/donut_model.dart';
import 'package:rjc_codelab_4/data/repositories/donut_filter_bar_repo.dart';
import 'package:rjc_codelab_4/data/repositories/donut_repo.dart';

class DonutService extends ChangeNotifier {
  String? selectedDonutType;
  List<DonutModel> filteredDonuts = [];

  DonutService() {
    selectedDonutType = DonutFilterBarRepo.filterBarItems.first.id;
    filteredDonutsByType(selectedDonutType!);
  }

  void filteredDonutsByType(String type) {
    selectedDonutType = type;
    filteredDonuts = DonutRepo.donuts
        .where((item) => item.type == selectedDonutType)
        .toList();
    notifyListeners();
  }
}

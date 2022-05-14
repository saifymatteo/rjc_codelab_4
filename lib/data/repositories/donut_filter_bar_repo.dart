import 'package:rjc_codelab_4/data/models/donut_filter_bar_model.dart';

abstract class DonutFilterBarRepo {
  static List<DonutFilterBarModel> filterBarItems = [
    DonutFilterBarModel(id: 'classic', label: 'Classic'),
    DonutFilterBarModel(id: 'sprinkled', label: 'Sprinkled'),
    DonutFilterBarModel(id: 'stuffed', label: 'Stuffed'),
  ];
}

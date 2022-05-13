import 'package:rjc_codelab_4/constants/constants.dart';
import 'package:rjc_codelab_4/data/models/donut_page_model.dart';

abstract class DonutPageRepo {
  static List<DonutPageModel> pages = [
    DonutPageModel(
        imgUrl: AppImage.donutPromo1, logoImgUrl: AppImage.donutLogoWhiteText),
    DonutPageModel(
        imgUrl: AppImage.donutPromo2, logoImgUrl: AppImage.donutLogoWhiteText),
    DonutPageModel(
        imgUrl: AppImage.donutPromo3, logoImgUrl: AppImage.donutLogoRedText),
  ];
}

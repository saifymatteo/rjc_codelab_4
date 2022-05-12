import 'package:flutter/material.dart';
import 'package:rjc_codelab_4/constants/constants.dart';

class DonutSideMenu extends StatelessWidget {
  const DonutSideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.mainDark,
      padding: const EdgeInsets.all(40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 40),
            child: Image.network(
              AppImage.donutLogoWhiteNoText,
              width: 100,
            ),
          ),
          Image.network(
            AppImage.donutLogoWhiteText,
            width: 150,
          ),
        ],
      ),
    );
  }
}

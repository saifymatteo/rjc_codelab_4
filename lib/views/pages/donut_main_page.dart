import 'package:flutter/material.dart';
import 'package:rjc_codelab_4/views/components/donut_pager.dart';

class DonutMainPage extends StatelessWidget {
  const DonutMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        DonutPager()
      ],
    );
  }
}
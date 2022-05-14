import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rjc_codelab_4/data/providers/donut_service.dart';
import 'package:rjc_codelab_4/views/components/donut_filter_bar.dart';
import 'package:rjc_codelab_4/views/components/donut_list.dart';
import 'package:rjc_codelab_4/views/components/donut_pager.dart';

class DonutMainPage extends StatelessWidget {
  const DonutMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const DonutPager(),
        DonutFilterBar(),
        Expanded(child: Consumer<DonutService>(
          builder: (_, provider, __) {
            return DonutList(donuts: provider.filteredDonuts);
          },
        )),
      ],
    );
  }
}

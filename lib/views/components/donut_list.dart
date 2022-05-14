import 'package:flutter/material.dart';
import 'package:rjc_codelab_4/views/components/donut_card.dart';

import '../../data/models/donut_model.dart';

class DonutList extends StatefulWidget {
  const DonutList({Key? key, this.donuts}) : super(key: key);

  final List<DonutModel>? donuts;

  @override
  State<DonutList> createState() => _DonutListState();
}

class _DonutListState extends State<DonutList> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  List<DonutModel> insertedItems = [];

  @override
  void initState() {
    var future = Future(() {});
    // for (int i = 0; i < widget.donuts!.length; i++) {
    //   future = future.then((_) {
    //     return Future.delayed(const Duration(milliseconds: 125), () {
    //       insertedItems.add(widget.donuts![i]);
    //       _key.currentState!.insertItem(i);
    //     });
    //   });
    // }
    for (var i in widget.donuts!) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 125), () {
          insertedItems.add(widget.donuts![widget.donuts!.indexOf(i)]);
          _key.currentState!.insertItem(widget.donuts!.indexOf(i));
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _key,
      scrollDirection: Axis.horizontal,
      initialItemCount: insertedItems.length,
      itemBuilder: (_, index, animation) {
        
        DonutModel currentDonut = widget.donuts![index];

        return SlideTransition(
          position: Tween(
            begin: const Offset(0.2, 0.0),
            end: const Offset(0.0, 0.0),
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: FadeTransition(
              opacity: Tween(begin: 0.0, end: 1.0).animate(
                CurvedAnimation(parent: animation, curve: Curves.easeInOut),
              ),
              child: DonutCard(donutModel: currentDonut)),
        );
      },
    );
  }
}

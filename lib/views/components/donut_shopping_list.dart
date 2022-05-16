import 'package:flutter/material.dart';
import 'package:rjc_codelab_4/data/models/donut_model.dart';
import 'package:rjc_codelab_4/views/components/donut_shopping_list_row.dart';

class DonutShoppingList extends StatefulWidget {
  const DonutShoppingList({Key? key, this.donutCart, this.isShoppingList = true}) : super(key: key);

  final List<DonutModel>? donutCart;
  final bool? isShoppingList;

  @override
  State<DonutShoppingList> createState() => _DonutShoppingListState();
}

class _DonutShoppingListState extends State<DonutShoppingList> {
  final GlobalKey<AnimatedListState> _key = GlobalKey();
  List<DonutModel> insertedItems = [];

  @override
  void initState() {
    var future = Future(() {});
    for (var i in widget.donutCart!) {
      future = future.then((_) {
        return Future.delayed(const Duration(milliseconds: 125), () {
          insertedItems.add(widget.donutCart![widget.donutCart!.indexOf(i)]);
          _key.currentState!.insertItem(widget.donutCart!.indexOf(i));
        });
      });
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList(
      key: _key,
      initialItemCount: insertedItems.length,
      itemBuilder: (_, index, animation) {
        DonutModel currentDonut = widget.donutCart![index];

        return SlideTransition(
          position: Tween(
            begin: const Offset(0.0, 0.2),
            end: const Offset(0.0, 0.0),
          ).animate(
            CurvedAnimation(parent: animation, curve: Curves.easeInOut),
          ),
          child: FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(
              CurvedAnimation(parent: animation, curve: Curves.easeInOut),
            ),
            child: DonutShoppingListRow(
              donut: currentDonut,
              isShoppingList: widget.isShoppingList!,
            ),
          ),
        );
      },
    );
  }
}

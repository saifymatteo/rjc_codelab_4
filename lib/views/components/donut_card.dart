import 'package:flutter/material.dart';
import 'package:rjc_codelab_4/constants/colors.dart';
import 'package:rjc_codelab_4/data/models/donut_model.dart';

class DonutCard extends StatelessWidget {
  const DonutCard({Key? key, this.donutModel}) : super(key: key);

  final DonutModel? donutModel;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 150,
          alignment: Alignment.bottomLeft,
          padding: const EdgeInsets.all(15),
          margin: const EdgeInsets.fromLTRB(10, 80, 10, 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0.0, 4.0),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                donutModel!.name!,
                style: const TextStyle(
                  color: AppColor.mainDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 10),
              Container(
                decoration: BoxDecoration(
                  color: AppColor.mainColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Text(
                  '\$${donutModel!.price!.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Image.network(
            donutModel!.imgUrl!,
            width: 150,
            height: 150,
            fit: BoxFit.contain,
          ),
        )
      ],
    );
  }
}

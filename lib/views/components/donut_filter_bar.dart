import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rjc_codelab_4/constants/constants.dart';
import 'package:rjc_codelab_4/data/models/donut_filter_bar_model.dart';
import 'package:rjc_codelab_4/data/providers/donut_service.dart';
import 'package:rjc_codelab_4/data/repositories/donut_filter_bar_repo.dart';

class DonutFilterBar extends StatelessWidget {
  DonutFilterBar({Key? key}) : super(key: key);

  final List<DonutFilterBarModel> filterBarItems =
      DonutFilterBarRepo.filterBarItems;

  Alignment alignmentBasedOnTap(filterBarId) {
      switch (filterBarId) {
        case 'classic':
          return Alignment.centerLeft;
        case 'sprinkled':
          return Alignment.center;
        case 'stuffed':
          return Alignment.centerRight;
        default:
          return Alignment.centerLeft;
      }
    }

  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Consumer<DonutService>(
        builder: (_, provider, __) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(filterBarItems.length, (index) {
                  DonutFilterBarModel currentFilterBar = filterBarItems[index];

                  return GestureDetector(
                    onTap: () {
                      provider.filteredDonutsByType(currentFilterBar.id!);
                    },
                    child: SizedBox(
                      child: Text(
                        currentFilterBar.label!,
                        style: TextStyle(
                          color:
                              provider.selectedDonutType == currentFilterBar.id
                                  ? AppColor.mainColor
                                  : Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  );
                }),
              ),
              const SizedBox(height: 10),
              Stack(
                children: [
                  AnimatedAlign(
                    alignment: alignmentBasedOnTap(provider.selectedDonutType),
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    child: Container(
                      width: MediaQuery.of(context).size.width / 3 - 20,
                      height: 5,
                      decoration: BoxDecoration(
                        color: AppColor.mainColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

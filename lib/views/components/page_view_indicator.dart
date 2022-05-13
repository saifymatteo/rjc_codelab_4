import 'package:flutter/material.dart';
import 'package:rjc_codelab_4/constants/colors.dart';

class PageViewIndicator extends StatelessWidget {
  const PageViewIndicator({
    Key? key,
    this.pageController,
    this.numberOfPages,
    this.currentPage,
  }) : super(key: key);

  final PageController? pageController;
  final int? numberOfPages;
  final int? currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(numberOfPages!, (index) {
        return GestureDetector(
          onTap: () {
            pageController!.animateToPage(
              index,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
            );
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeInOut,
            width: 15,
            height: 15,
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: currentPage == index
                  ? AppColor.mainColor
                  : Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        );
      }),
    );
  }
}

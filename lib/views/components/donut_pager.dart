import 'package:flutter/material.dart';
import 'package:rjc_codelab_4/data/models/donut_page_model.dart';
import 'package:rjc_codelab_4/data/repositories/donut_page_repo.dart';
import 'package:rjc_codelab_4/views/components/page_view_indicator.dart';

class DonutPager extends StatefulWidget {
  const DonutPager({Key? key}) : super(key: key);

  @override
  State<DonutPager> createState() => _DonutPagerState();
}

class _DonutPagerState extends State<DonutPager> {
  int currentPage = 0;
  PageController? pageController;
  List pages = DonutPageRepo.pages;

  @override
  void initState() {
    pageController = PageController(initialPage: currentPage);
    super.initState();
  }

  @override
  void dispose() {
    pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height / 2 - 100,
      child: Column(
        children: [
          Expanded(
            child: PageView(
              scrollDirection: Axis.horizontal,
              pageSnapping: true,
              controller: pageController,
              children: List.generate(pages.length, (index) {
                DonutPageModel currentPage = pages[index];

                return Container(
                  alignment: Alignment.bottomLeft,
                  margin: const EdgeInsets.all(20),
                  padding: const EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 10,
                        offset: const Offset(0.0, 5.0),
                      ),
                    ],
                    image: DecorationImage(
                      image: NetworkImage(currentPage.imgUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Image.network(currentPage.logoImgUrl!, width: 120),
                );
              }),
              onPageChanged: (index) {
                setState(() {
                  currentPage = index;
                });
              },
            ),
          ),
          PageViewIndicator(
            pageController: pageController,
            numberOfPages: pages.length,
            currentPage: currentPage,
          ),
        ],
      ),
    );
  }
}

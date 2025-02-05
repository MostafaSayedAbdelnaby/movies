import 'package:flutter/material.dart';
import '../../../widgets/category_item.dart';
import '../../../widgets/explore_list.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}
int currentIndex = 0;

class _ExploreTabState extends State<ExploreTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(
                height: 52,
                child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            setState(() {
                              currentIndex = index;
                            });
                          },
                          child: CategoryItem(isSelected: currentIndex == index)
                      );
                    },
                    separatorBuilder: (context, index) => const SizedBox(width: 8),
                    itemCount: 5),
              ),
              const SizedBox(
                height: 24,
              ),
              const ExploreList()
            ],
          ),
        ),
      ),
    );
  }

}

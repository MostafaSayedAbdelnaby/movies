import 'package:flutter/material.dart';
import 'package:movies_app/screen/home_screen/tabs/profile_tab/profile_tab_bar.dart';
import '../../move_card.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: const Color(0xFF121312),
        body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return [
              const SliverAppBar(
                expandedHeight: 389,
                collapsedHeight: 389,
                pinned: false,
                flexibleSpace: SafeArea(child: ProfileTabBar()),
              )
            ];
          },
          body: TabBarView(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: Image.asset('assets/images/popcorn.png'),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 16.0, left: 16, top: 16),
                child: CustomScrollView(
                  physics: const NeverScrollableScrollPhysics(),
                  slivers: [
                    SliverGrid(
                      delegate: SliverChildBuilderDelegate(
                            (context, index) {
                          return MovieCard(
                            // height: double.infinity,
                            // width: double.infinity,
                          );
                        },
                        childCount: 12,
                      ),
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          childAspectRatio: 0.55 ,
                          crossAxisCount: 3,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

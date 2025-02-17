import 'package:flutter/material.dart';
import '../features/home/presentation/widgets/home_screen/tabs/explore_tab/explore_list_bloc_builder.dart';
import '../features/home/presentation/widgets/home_screen/tabs/explore_tab/genre_bloc_builder.dart';
import 'explore_list_widget.dart';

class ExploreTab extends StatelessWidget {
  const ExploreTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF202020),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(
                height: 52,
                child: GenreBlocBuilder(),
              ),
              SizedBox(
                height: 24,
              ),
              Expanded(child: ExploreListBlocBuilder()),
            ],
          ),
        ),
      ),
    );
  }
}

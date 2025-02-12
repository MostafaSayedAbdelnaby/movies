
import 'package:flutter/material.dart';

import 'home_tab_down_bloc_builder_widget.dart';
import 'home_tab_down_future_builder_widget.dart';
import 'home_tab_up_future_builder_widget.dart';

class HomeTabDown extends StatelessWidget {
  const HomeTabDown({super.key, this.movieId});
  final int? movieId;
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text('Action',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colors.white)),
              Spacer(),
              Text(
                'See More',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFF6BD00)),
              ),
              SizedBox(
                width: 4,
              ),
              Icon(Icons.arrow_forward,
                  color: Color(0xFFF6BD00), size: 15)
            ],
          ),
        ),
        SizedBox(height: 16),
        // HomeTabUpFutureBuilderWidget(),
        HomeTabDownBlocBuilderWidget(),
      ],
    );
  }
}

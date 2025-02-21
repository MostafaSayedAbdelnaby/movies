
import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/app_text_theme.dart';
import 'package:movies_app/core/widgets/app_colors.dart';

import 'home_tab_down_bloc_builder_widget.dart';
import 'home_tab_down_future_builder_widget.dart';
import 'home_tab_up_future_builder_widget.dart';

class HomeTabDown extends StatelessWidget {
  const HomeTabDown({super.key, this.movieId});
  final int? movieId;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text('Action',
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400
                  )),
              const Spacer(),
              Text(
                'See More',
                style: textTheme.labelMedium,
              ),
              const SizedBox(
                width: 4,
              ),
              const Icon(Icons.arrow_forward,
                  color: AppColors.primaryColor, size: 15)
            ],
          ),
        ),
        const SizedBox(height: 16),
        HomeTabDownBlocBuilderWidget(),
      ],
    );
  }
}

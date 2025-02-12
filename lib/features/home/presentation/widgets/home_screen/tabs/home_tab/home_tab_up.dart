import 'package:flutter/material.dart';

import 'home_tab_up_bloc_builder_widget.dart';
import 'home_tab_up_future_builder_widget.dart';

class HomeTabUp extends StatelessWidget {
  const HomeTabUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 450,
          width: double.infinity,
          child: Image.asset(
            'assets/images/onboarding_6.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 450,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF121312).withOpacity(0.8),
                const Color(0xFF121312).withOpacity(0.6),
                const Color(0xFF121312),
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Column(
          children: [
            Image.asset(
              'assets/images/Available Now.png',
            ),
            const SizedBox(height: 20),
            HomeTabUpBlocBuilderWidget(),
            const SizedBox(height: 16),
            SizedBox(
              width: 300,
              child: Image.asset(
                'assets/images/Watch Now.png',
                // fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

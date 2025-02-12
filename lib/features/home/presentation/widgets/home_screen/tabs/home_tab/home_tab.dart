import 'package:flutter/material.dart';
import '../../../widgets/home_tab_down.dart';
import '../../../widgets/home_tab_up.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFF171717),
      body: SafeArea(
          child: SingleChildScrollView(
                  child:Column(
          children: [
            HomeTabUp(),
            SizedBox(height: 22),
            HomeTabDown(),
            SizedBox(height: 22),
          ],
                  )
                )
      ),
    );
  }
}
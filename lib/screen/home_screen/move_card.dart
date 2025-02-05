import 'package:flutter/material.dart';

class MoveCard extends StatelessWidget {
  final String title;
  final String imageUrl;

  const MoveCard(this.title, this.imageUrl, {super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          "assets/images/onboarding_6.png",
          fit: BoxFit.fill,
          height: double.infinity,
          width: double.infinity,
        ),
        Column(
          children: [
            Image.asset(
              "assets/images/Available Now.png",
              // fit: BoxFit.fill,
            ),

            Image.asset(
              "assets/images/Watch Now.png",
              // fit: BoxFit.fill,
            ),
          ],
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/widgets/app_colors.dart';

class RowItem extends StatelessWidget {
  final String imageName;

// final num data;
  final String data;

  const RowItem({
    required this.imageName,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: 100,
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image.asset(
          'assets/images/$imageName.png',
          color: const Color(0xFFF6BD00),
          height: 25,
          width: 28,
        ),
        Text(
          data,
          style: const TextStyle(
              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),
        )
      ]),
    );
  }
}

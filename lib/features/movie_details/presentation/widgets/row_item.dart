import 'package:flutter/material.dart';

import '../../../../core/widgets/app_colors.dart';

class RowItem extends StatelessWidget {
  final String imageName;
  final num data;
  const RowItem({
    required this.imageName,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47,
      width: 100,
      decoration: BoxDecoration(
          color: AppColors.backgroundColor,
          borderRadius: BorderRadius.circular(16)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Image.asset('assets/images/$imageName.png'),
        Text(
          '$data',
          style: const TextStyle(color: Colors.white, fontSize: 20),
        )
      ]),
    );
  }
}
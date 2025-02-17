import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/app_text_theme.dart';

import '../../../../core/widgets/app_colors.dart';

class RowItem extends StatelessWidget {
  final String imageName;
  final String data;

  const RowItem({
    required this.imageName,
    required this.data,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 48,
      width: 94,
      decoration: BoxDecoration(
          color: AppColors.textFormFieldBackgroundColor,
          borderRadius: BorderRadius.circular(16)),
      child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/$imageName.png',
              color: AppColors.primaryColor,
              height: 25,
              width: 28,
            ),
            const SizedBox(width: 8),
            Text(
              data,
              style: textTheme.bodyMedium,
            )
          ]),
    );
  }
}

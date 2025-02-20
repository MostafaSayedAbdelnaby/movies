import 'package:flutter/material.dart';
import '../theme/app_text_theme.dart';
import 'app_colors.dart';


typedef Validator = String? Function(String?)?;
// ignore: must_be_immutable
class MoviesTextFormField extends StatelessWidget {
  final String prefixIconImageName;
  final String labelText;
  final String? suffixIconImageName;
  final Validator onTap;

  final TextEditingController? textEditingController;

  const MoviesTextFormField({
    required this.labelText,
    this.suffixIconImageName,
    super.key,
    required this.prefixIconImageName,
    required this.onTap,
    this.textEditingController,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      autocorrect: true,
      style: textTheme.headlineSmall,
      validator: onTap,
      decoration: InputDecoration(
        fillColor: AppColors.textFormFieldBackgroundColor,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: labelText,
        labelStyle: labelMedium.copyWith(color: AppColors.textColor),
        suffixIcon: suffixIconImageName != null
            ? const Icon(
                Icons.visibility_off,
                color: AppColors.textColor,
              )
            : const SizedBox(),
        prefixIcon: Image.asset(
          'assets/icons/$prefixIconImageName.png',
          color: AppColors.textColor,
        ),
      ),
    );
  }
}

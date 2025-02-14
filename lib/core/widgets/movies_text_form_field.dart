import 'package:flutter/material.dart';
import '../theme/app_text_theme.dart';
import 'app_colors.dart';

// ignore: must_be_immutable
class MoviesTextFormField extends StatelessWidget {
  // final IconData prefixIcon;
  final String prefixIconImageName;
  final String labelText;
  final String? suffixIconImageName;

  MoviesTextFormField({
    required this.labelText,
    this.suffixIconImageName,
    super.key,
    required this.prefixIconImageName,
    //required this.prefixIcon
  });

  var textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      autocorrect: true,
      style: textTheme.headlineSmall,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null; // return null if the input is valid
      },
      decoration: InputDecoration(
        fillColor: AppColors.textFormFieldBackgroundColor,
        filled: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        labelText: labelText,
        labelStyle: labelMedium.copyWith(color: AppColors.textColor),
        // suffixIcon: suffixIconImageName != null
        //     ? Image.asset('assets/images/$suffixIconImageName.png')
        //     : const SizedBox(),
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
        // prefixIcon: Icon(
        //   prefixIcon,
        //   color: const Color(0xFFFFFFFF),
        // ),
      ),
    );

    // TextField(
    //   decoration: InputDecoration(
    //     border: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(16),
    //       borderSide: const BorderSide(width: 1, color: Color(0xFF282A28)),
    //     ),
    //     focusedBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(16),
    //       borderSide: const BorderSide(width: 1, color: Color(0xFF282A28)),
    //     ),
    //     enabledBorder: OutlineInputBorder(
    //       borderRadius: BorderRadius.circular(16),
    //       borderSide: const BorderSide(width: 1, color: Color(0xFF282A28)),
    //     ),
    //   ),
    // );
  }
}

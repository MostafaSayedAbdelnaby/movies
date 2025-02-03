import 'package:flutter/material.dart';
import 'package:movies_app/app_resources/app_colors.dart';
import 'package:movies_app/app_resources/app_text_theme.dart';

class MoviesTextFormField extends StatelessWidget {
   String prefixIconImageName;
   String labeText;
   String? suffixIconImageName;
  
   MoviesTextFormField({required this.prefixIconImageName,required this.labeText,this.suffixIconImageName,super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration:  InputDecoration(prefixIcon: Image.asset('assets/images/$prefixIconImageName.png'),
        enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(15)),
         fillColor: AppColors.textFormFieldBackgroundColr ,
         filled: true,
         labelText: labeText,
         labelStyle: labelMedium.copyWith(color: AppColors.textColor),
         suffixIcon: suffixIconImageName != null ? Image.asset('assets/images/$suffixIconImageName.png'):const SizedBox(),
    ));
  }
}
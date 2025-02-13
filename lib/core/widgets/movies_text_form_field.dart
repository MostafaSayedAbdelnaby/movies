// import 'package:flutter/material.dart';
//
// import 'app_colors.dart';
//
// class MoviesTextFormField extends StatelessWidget {
//    String prefixIconImageName;
//    String labelText;
//    String? suffixIconImageName;
//
//    MoviesTextFormField({required this.prefixIconImageName,required this.labelText,this.suffixIconImageName,super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return TextFormField(
//       decoration:  InputDecoration(prefixIcon: Image.asset('assets/images/$prefixIconImageName.png'),
//         enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(15)),
//          fillColor: AppColors.textFormFieldBackgroundColr ,
//          filled: true,
//          labelText: labelText,
//          labelStyle: labelMedium.copyWith(color: AppColors.textColor),
//          suffixIcon: suffixIconImageName != null ? Image.asset('assets/images/$suffixIconImageName.png'):const SizedBox(),
//     ));
//   }
// }
import 'package:flutter/material.dart';

class MoviesElevatedButton extends StatelessWidget{
   final Color backgroundColor;
   final Widget child;
   final VoidCallback onPressed;
   MoviesElevatedButton({required this.backgroundColor,required this.child,required this.onPressed,super.key});
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: double.infinity,
      child: SizedBox(height: 56,
        child: ElevatedButton(style:ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))
        ),onPressed: onPressed,child: child,),
      ),
    );

}
}
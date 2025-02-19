import 'package:flutter/material.dart';

class MoviesElevatedButton extends StatelessWidget {
  final Color color;
  final Widget child;
  final VoidCallback onPressed;

  const MoviesElevatedButton(
      {required this.color,
      required this.child,
      required this.onPressed,
      super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: SizedBox(
        height: 56,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            // padding: const EdgeInsets.symmetric(vertical: 12),
            backgroundColor: color,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}

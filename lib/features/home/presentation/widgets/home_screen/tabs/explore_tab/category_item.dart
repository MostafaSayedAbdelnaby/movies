import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final bool isSelected;
  final String nameCategory;
   const CategoryItem({super.key, required this.isSelected,required this.nameCategory});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFF6BD00) : Colors.transparent,
        border: Border.all(
          width: 2,
          color: const Color(0xFFF6BD00),
        ),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(
          nameCategory,
          style: TextStyle(
            color: isSelected ? const Color(0xFF202020) : const Color(0xFFF6BD00),
          )),
    );
  }
}

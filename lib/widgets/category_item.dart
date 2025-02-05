import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final bool isSelected;

  const CategoryItem({super.key, required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Text('Action',
          style: TextStyle(
            color: isSelected ? const Color(0xFF202020) : const Color(0xFFF6BD00),
          )),
    );
  }
}

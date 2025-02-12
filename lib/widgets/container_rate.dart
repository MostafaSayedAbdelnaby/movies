import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

class ContainerRate extends StatelessWidget {
  final String imageName;
  final String number;

  const ContainerRate(
      {super.key, required this.imageName, required this.number});

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: const EdgeInsets.only(top: 12, right: 8, left: 8),
      alignment: Alignment.center,
      height: 48,
      width: 100,
      decoration: BoxDecoration(
        color: const Color(0xFF282A28),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // ImageIcon(
          //   size: 28,
          //   color: const Color(0xFFF6BD00),
          //   AssetImage('assets/images/$imageName.png'),
          // ),
          Image.asset(
            'assets/images/$imageName.png',
            color: const Color(0xFFF6BD00),
            height: 25,
            width: 28,
          ),
          const SizedBox(width: 8),
          Text(
            number,
            style: const TextStyle(
              fontSize: 16, // 24
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

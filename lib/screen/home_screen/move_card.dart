import 'package:flutter/material.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 351,
      width: 234,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset('assets/images/onboarding_6.png')),
          Container(
            margin: const EdgeInsets.only(top: 12, right: 8, left: 8),
            alignment: Alignment.center,
            height: 28,
            width: 58,
            decoration: BoxDecoration(
              color: const Color(0xb5121312),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '7.7',
                  style: TextStyle(
                   fontSize: 16,
                   fontWeight: FontWeight.w400,
                    color: Colors.white
                  ),
                ),
                const SizedBox(width: 4),
                Image.asset(
                  'assets/images/icon_rate.png',
                  height: 15,
                  width: 15,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

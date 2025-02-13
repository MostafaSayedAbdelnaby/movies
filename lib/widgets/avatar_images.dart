import 'package:flutter/material.dart';

class AvatarImages extends StatefulWidget {
  final Function(int) avatarSelected;

  const AvatarImages({super.key, required this.avatarSelected});

  @override
  State<AvatarImages> createState() => _AvatarImagesState();
}

int currentIndex = 0;

class _AvatarImagesState extends State<AvatarImages> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 389,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
              color: const Color(0xFF282A28),
              borderRadius: BorderRadius.circular(24),
            ),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.96),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                    });
                    widget.avatarSelected(index);
                  },
                  child: Container(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                    decoration: BoxDecoration(
                      color: currentIndex == index
                          ? const Color(0xFFF6BD00).withOpacity(0.50)
                          : Colors.transparent,
                      border: Border.all(color: const Color(0xFFF6BD00)),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/images/avatar_${index + 1 % 2}.png',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
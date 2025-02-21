import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AvatarCarouselWidget extends StatelessWidget {
  int image=0;
  AvatarCarouselWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
          initialPage: 1,
          // aspectRatio: 11 / 9,
          animateToClosest: true,
          disableCenter: false,
          enlargeCenterPage: true,
          enableInfiniteScroll: false,
          viewportFraction: 0.42,
          enlargeStrategy: CenterPageEnlargeStrategy.zoom,
          enlargeFactor: 0.58,
          height: 130,
          scrollDirection: Axis.horizontal,
        ),
        itemCount: 9,
        itemBuilder: (context, index, realIndex) {
          return CircleAvatar(
              radius: 58,
              child: Image.asset(
                // "assets/images/image_avatar_${index + 1}.png",
                "assets/images/image_avatar_${index + 1}@3x.png",
                fit: BoxFit.fill,
              ),
          );
        },
    );
  }
}

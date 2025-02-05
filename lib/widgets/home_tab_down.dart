import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../screen/home_screen/move_card.dart';

class HomeTabDown extends StatelessWidget {
  const HomeTabDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text('Action',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400,color: Colors.white)),
              Spacer(),
              Text(
                'See More',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFF6BD00)),
              ),
              SizedBox(
                width: 4,
              ),
              Icon(Icons.arrow_forward,
                  color: Color(0xFFF6BD00), size: 15)
            ],
          ),
        ),
        const SizedBox(height: 16),
        CarouselSlider.builder(
          options: CarouselOptions(
              initialPage: 1,
              aspectRatio: 16 / 9,
              animateToClosest: true,
              disableCenter: true,
              viewportFraction: 0.39,
              scrollDirection: Axis.horizontal),
          itemCount: 3,
          itemBuilder: (context, index, realIndex) {
            return const MovieCard();
          },
        ),
      ],
    );
  }
}

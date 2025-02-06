import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/features/home/data/repositories/home_repo.dart';
import 'package:movies_app/features/home/domain/entities/movie_entity.dart';
import '../screen/home_screen/move_card.dart';

class HomeTabUp extends StatelessWidget {
  const HomeTabUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: 550,
          width: double.infinity,
          child: Image.asset(
            'assets/images/onboarding_6.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 550,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF121312).withOpacity(0.8),
                // Dark color at the bottom
                const Color(0xFF121312).withOpacity(0.6),
                // Transparent at the top
              ],
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
        ),
        Column(
          children: [
            Image.asset(
              'assets/images/Available Now.png',
              // fit: BoxFit.cover,
            ),
            const SizedBox(height: 24),
            FutureBuilder<List<MovieEntity>>(
                future: HomeRepo().getWatchNowMovies(),
                builder: (context, snapshot) {
                  return CarouselSlider.builder(
                    options: CarouselOptions(
                        initialPage: 1,
                        aspectRatio: 16 / 9,
                        animateToClosest: true,
                        disableCenter: false,
                        enlargeCenterPage: true,
                        enableInfiniteScroll: false,
                        viewportFraction: 0.55,
                        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                        enlargeFactor: 0.55,
                        height: 280,
                        scrollDirection: Axis.horizontal),
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index, realIndex) {
                      return MovieCard(movieModel: snapshot.data?[index]);
                    },
                  );
                }),
            const SizedBox(height: 16),
            SizedBox(
              width: 300,
              child: Image.asset(
                'assets/images/Watch Now.png',
                // fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

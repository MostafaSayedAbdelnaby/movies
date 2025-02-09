import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api_helper/api_helper.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
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
          height: 450,
          width: double.infinity,
          child: Image.asset(
            'assets/images/onboarding_6.png',
            fit: BoxFit.cover,
          ),
        ),
        Container(
          height: 450,
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color(0xFF121312).withOpacity(0.8),
                const Color(0xFF121312).withOpacity(0.6),
                const Color(0xFF121312),
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
            ),
            const SizedBox(height: 20),
            FutureBuilder<List<MovieModel>>(
                future: ApiHelper().getWatchNowMovies(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('E123: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No data available'));
                  }
                  return CarouselSlider.builder(
                    options: CarouselOptions(
                      initialPage: 1,
                      aspectRatio: 16 / 9,
                      animateToClosest: true,
                      disableCenter: false,
                      enlargeCenterPage: true,
                      enableInfiniteScroll: false,
                      viewportFraction: 0.56,
                      enlargeStrategy: CenterPageEnlargeStrategy.zoom,
                      enlargeFactor: 0.46,
                      height: 280,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: snapshot.data?.length ?? 0,
                    itemBuilder: (context, index, realIndex) {
                      return MovieCard(
                        // height: 351,
                        // width: 234,
                        movieModel: snapshot.data?[index],
                      );
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

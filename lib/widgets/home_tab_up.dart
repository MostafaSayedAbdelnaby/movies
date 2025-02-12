import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api_helper/api_helper.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
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

            futureBuilderHomeUp(),

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


  Widget futureBuilderHomeUp(){
    return FutureBuilder<List<MovieModel>>(
        future: ApiHelper().getWatchNowMovies(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('E123: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No data available'));
          }
         return homeUpLoadedWidget(snapshot.data!);
        }
    );
  }

  Widget homeUpLoadedWidget (List<MovieModel> movieModel){
     return CarouselSlider.builder(
      options: CarouselOptions(
        initialPage: 1,
        aspectRatio: 16 / 9,
        animateToClosest: true,
        disableCenter: false,
        enlargeCenterPage: true,
        enableInfiniteScroll: false,
        viewportFraction: 0.6,
        enlargeStrategy: CenterPageEnlargeStrategy.zoom,
        enlargeFactor: 0.46,
        height: 300,
        scrollDirection: Axis.horizontal,
      ),
      itemCount: movieModel.length,
      itemBuilder: (context, index, realIndex) {
        return MovieCard(
          height: 300,
          width: 200,
          movieModel: movieModel[index],
        );
      },
    );
  }

}

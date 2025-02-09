import 'dart:math';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/api_helper/api_helper.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import '../features/home/data/data_source/remote_data_source.dart';
import '../features/home/data/models/movie_details_model.dart';
import '../screen/home_screen/move_card.dart';

class HomeTabDown extends StatelessWidget {
  const HomeTabDown({super.key, this.movieId});
  final int? movieId;
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
        FutureBuilder<List<MovieModel>>(
          future: ApiHelper().getUpcomingMovies(), ///***
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            else if (snapshot.hasError) {
              return Center(child: Text('E123: ${snapshot.error}'));
            }
            else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No data available'));
            }
            return CarouselSlider.builder(
              options: CarouselOptions(
                  initialPage: 1,
                  aspectRatio: 15 / 11,
                  animateToClosest: true,
                  enableInfiniteScroll: false,
                  disableCenter: true,
                  viewportFraction: 0.52,
                  scrollDirection: Axis.horizontal),
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index, realIndex) {
                return  MovieCard(movieModel:snapshot.data?[index] ,);
              },
            );
          }
        ),

        // FutureBuilder<MovieDetailsModel>(
        //     future: RemoteDataSource().getMovieDetails(movieId ?? 1),   /// ****
        //     builder: (context, snapshot) {
        //       if (snapshot.connectionState == ConnectionState.waiting) {
        //         return const Center(child: CircularProgressIndicator());
        //       }
        //       else if (snapshot.hasError) {
        //         return Center(child: Text('E123: ${snapshot.error}'));
        //       }
        //       else if (!snapshot.hasData || snapshot.data == null) {
        //         return const Center(child: Text('No data available'));
        //       }
        //       final movieDetails = snapshot.data!;
        //
        //       return CarouselSlider.builder(
        //         options: CarouselOptions(
        //             initialPage: 1,
        //             aspectRatio: 15 / 11,
        //             animateToClosest: true,
        //             enableInfiniteScroll: false,
        //             disableCenter: true,
        //             viewportFraction: 0.52,
        //             scrollDirection: Axis.horizontal),
        //         itemCount:1,
        //         itemBuilder: (context, index, realIndex) {
        //           return  MovieCard(remoteDataSource:movieDetails );
        //         },
        //       );
        //     }
        // ),

      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/features/movie_details/data/data_source/movie_details_remote_data_source_imp.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/movie_details_screen_shots_widget.dart';

class TestScreenShots extends StatelessWidget {
  const TestScreenShots({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
        future: MovieDetailsRemoteDataSourceImp()
            .getMovieDetailsScreenShots(939243),
        builder: (context, snapshot) {
          return Scaffold(
            body: Column(
              children: [
                SizedBox(
                  height: 400,
                  child: MovieDetailsScreenShotsWidget(
                      imagePathList: snapshot.data ?? []),
                ),
              ],
            ),
          );
        });
  }
}

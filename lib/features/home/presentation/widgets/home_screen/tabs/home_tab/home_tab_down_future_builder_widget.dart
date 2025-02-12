import 'package:flutter/material.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';
import 'package:movies_app/features/home/presentation/widgets/home_screen/tabs/home_tab/home_tab_down_loaded_widget.dart';

class HomeTabUpFutureBuilderWidget extends StatelessWidget{

@override
  Widget build(BuildContext context) {
    return FutureBuilder<List<MovieModel>>(
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
            return HomeTabDownLoadedWidget(snapshot.data!);
          }
        )
	}
}
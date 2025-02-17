import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/service_locator.dart';
import 'package:movies_app/features/home/data/models/genre_model.dart';
import 'package:movies_app/features/home/presentation/bloc/movie_cubit/movie_cubit.dart';
import 'category_item.dart';

class GenreWidget extends StatefulWidget {
  List<GenreModel> genreModelList;

  GenreWidget({super.key, required this.genreModelList});

  @override
  State<GenreWidget> createState() => _GenreWidgetState();
}

class _GenreWidgetState extends State<GenreWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
                serviceLocator<MovieCubit>()
                    .getMovieByGenre(widget.genreModelList[index].id.toString());
              },
              child: CategoryItem(
                  isSelected: currentIndex == index,
                  nameCategory: widget.genreModelList[index].name ?? ""));
        },
        separatorBuilder: (context, index) => const SizedBox(width: 8),
        itemCount: widget.genreModelList.length);
  }
}

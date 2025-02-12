class HomeTabUpLoadedWidget extends StatelessWidget{
final movieEntityList;
HomeTabUpLoadedWidget({required this.movieEntityList})
Widget build(BuildContext context){
  
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
                    itemCount: movieEntityList.length ?? 0,
                    itemBuilder: (context, index, realIndex) {
                      return MovieCard(
                        // height: 351,
                        // width: 234,
                        movieModel: movieEntityList?[index],
                      );
}
}
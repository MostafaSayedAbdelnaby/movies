class HomeTabUpFutureBuilderWidget extends StatelessWidget{

@override
  Widget build(BuildContext context) {
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
                  return HomeTabUpLoadedWidget(movieModelList:snapshot.data!);
                });
}
}
import 'package:flutter/material.dart';
import 'package:movies_app/api_helper/api_helper.dart';
import 'package:movies_app/features/home/data/models/genre_model.dart';
import '../../../widgets/category_item.dart';
import '../../../widgets/explore_list.dart';

class ExploreTab extends StatefulWidget {
  const ExploreTab({super.key});

  @override
  State<ExploreTab> createState() => _ExploreTabState();
}
int currentIndex = 0;
int genreId = 28;

class _ExploreTabState extends State<ExploreTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF202020),
      // backgroundColor: Colors.transparent,   // remove this
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
          child: Column(
            children: [
              SizedBox(
                height: 52,
                child: FutureBuilder<List<GenreModel>>(
                  future: ApiHelper().getGenres(),
                  builder: (context, snapshot) {
                    if(snapshot.connectionState ==ConnectionState.waiting){
                      return const Center(child: CircularProgressIndicator(),);
                    }else if(snapshot.hasError){
                      return const Center(child: Text("Has Error"));
                    }
                    return ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                              onTap: () {
                                setState(() {
                                  currentIndex = index;
                                  genreId=snapshot.data![currentIndex].id!;
                                });
                              },
                              child: CategoryItem(
                                isSelected: currentIndex == index,
                                nameCategory : snapshot.data?[index].name ?? "" )
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(width: 8),
                        itemCount: snapshot.data?.length ?? 0 );
                  }
                ),
              ),
              const SizedBox(
                height: 24,
              ),
               Expanded(
                 child: ExploreList(
                  genreId: genreId,
                  ),
               )
            ],
          ),
        ),
      ),
    );
  }

}

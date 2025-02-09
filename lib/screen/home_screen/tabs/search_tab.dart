import 'package:flutter/material.dart';
import 'package:movies_app/api_helper/api_helper.dart';
import 'package:movies_app/features/home/data/models/movie_model.dart';

import '../move_card.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  final TextEditingController controller =TextEditingController();

   Widget _buildImage = Center(
    child: Image.asset("assets/images/popcorn.png"),
  );

  Widget _createGridView (){
    return FutureBuilder<List<MovieModel>>(
      future: ApiHelper().searchMovies(controller.text),
      builder: (context, snapshot) {
        if(snapshot.connectionState ==ConnectionState.waiting){
          return const Center(child: CircularProgressIndicator());
        }else if(snapshot.hasError){
          return const Center(child: Text("Has Error"));
        }
        return GridView.builder(
          padding: EdgeInsets.zero,
          itemCount: snapshot.data?.length ?? 0,
          itemBuilder: (context, index) {
            return MovieCard(
              // height: 351,
              // width: 234,
              movieModel: snapshot.data![index],  // Pass the entire movieDetailsModel
            );
          },
          gridDelegate:
          const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 20,
            childAspectRatio:
            0.65, // Proportion between width and height
          ),
        );
      }
    );
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFF171717),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 14),
        child: SafeArea(
          child: Container(
            color: const Color(0xFF171717),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    controller: controller,
                    autofocus: true,
                    onTap: () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      _buildImage =_createGridView();
                      setState(() {

                      });
                      },
                    style: const TextStyle(color: Color(0xFFFFFFFF)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF303030),
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: Color(0xFFFFFFFF)),
                      prefixIcon: Image.asset(
                        "assets/images/search.png",
                        color: const Color(0xFFFFFFFF),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                    child: _buildImage ,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

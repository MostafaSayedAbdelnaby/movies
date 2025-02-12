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
                    onChanged: (v) {
                      // FocusManager.instance.primaryFocus?.unfocus();
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




// import 'package:flutter/material.dart';
// import 'package:movies_app/api_helper/api_helper.dart';
// import 'package:movies_app/features/home/data/models/movie_model.dart';
// import '../move_card.dart';
//
// class SearchTab extends StatefulWidget {
//   const SearchTab({super.key});
//
//   @override
//   State<SearchTab> createState() => _SearchTabState();
// }
//
// class _SearchTabState extends State<SearchTab> {
//   final TextEditingController controller = TextEditingController();
//   late Future<List<MovieModel>> _movieSearchResults;
//
//   // Initial empty list of movies
//   List<MovieModel> _movies = [];
//
//   @override
//   void initState() {
//     super.initState();
//     _movieSearchResults = Future.value(_movies); // Initialize with an empty list
//   }
//
//   void _onSearchChanged(String query) {
//     setState(() {
//       if (query.isEmpty) {
//         _movies = [];
//         _movieSearchResults = Future.value(_movies); // Show empty results
//       } else {
//         _movieSearchResults = ApiHelper().searchMovies(query);
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 14),
//         child: SafeArea(
//           child: Container(
//             color: const Color(0xFF171717),
//             child: Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12),
//                   child: TextField(
//                     controller: controller,
//                     autofocus: true,
//                     onChanged: _onSearchChanged, // Use onChanged for live search
//                     style: const TextStyle(color: Color(0xFFFFFFFF)),
//                     decoration: InputDecoration(
//                       filled: true,
//                       fillColor: const Color(0xFF303030),
//                       hintText: 'Search',
//                       hintStyle: const TextStyle(color: Color(0xFFFFFFFF)),
//                       prefixIcon: Image.asset(
//                         "assets/images/search.png",
//                         color: const Color(0xFFFFFFFF),
//                       ),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(15.0),
//                         borderSide: BorderSide.none,
//                       ),
//                     ),
//                   ),
//                 ),
//                 Expanded(
//                   child: FutureBuilder<List<MovieModel>>(
//                     future: _movieSearchResults,
//                     builder: (context, snapshot) {
//                       if (snapshot.connectionState == ConnectionState.waiting) {
//                         return const Center(child: CircularProgressIndicator());
//                       } else if (snapshot.hasError) {
//                         return Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               const Icon(Icons.error, color: Colors.red),
//                               const SizedBox(height: 8),
//                               Text("An error occurred: ${snapshot.error}", textAlign: TextAlign.center),
//                               ElevatedButton(
//                                 onPressed: () {
//                                   setState(() {
//                                     _movieSearchResults = ApiHelper().searchMovies(controller.text);
//                                   });
//                                 },
//                                 child: const Text("Retry"),
//                               ),
//                             ],
//                           ),
//                         );
//                       } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//                         return const Center(child: Text("No results found."));
//                       } else {
//                         return GridView.builder(
//                           padding: EdgeInsets.zero,
//                           itemCount: snapshot.data!.length,
//                           itemBuilder: (context, index) {
//                             return MovieCard(
//                               movieModel: snapshot.data![index],  // Pass the movie model
//                             );
//                           },
//                           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                             crossAxisCount: 2,
//                             mainAxisSpacing: 8,
//                             crossAxisSpacing: 20,
//                             childAspectRatio: 0.65,
//                           ),
//                         );
//                       }
//                     },
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
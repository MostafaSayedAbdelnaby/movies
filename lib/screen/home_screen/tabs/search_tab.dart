import 'package:flutter/material.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF171717),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6 ,vertical: 14),
        child: SafeArea(
          child: Container(
            color: const Color(0xFF171717),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: TextField(
                    style: const TextStyle(color: Color(0xFFFFFFFF)),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF303030),
                      hintText: 'Search',
                      hintStyle: const TextStyle(color: Color(0xFFFFFFFF)),
                      prefixIcon: Image.asset("assets/images/search.png",color: Color(0xFFFFFFFF),),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Image.asset("assets/images/popcorn.png"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/screen/home_screen/tabs/explore_tab.dart';
import 'package:movies_app/screen/home_screen/tabs/home_tab.dart';
import 'package:movies_app/screen/home_screen/tabs/profile_tab/profile_tab.dart';
import 'package:movies_app/screen/home_screen/tabs/search_tab.dart';

class HomeScreen extends StatefulWidget {
  static const String tag = "HomeScreen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var backgroundColor =const Color(0xFF202020);
    return Scaffold(
      body: Stack(
          children: [
        tabs[currentIndex],
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Color(0xFF202020),
              ),
              child: BottomNavigationBar(
                backgroundColor: const Color(0xFF202020),
                currentIndex: currentIndex,
                onTap: _onItemTapped,
                items: [
                  BottomNavigationBarItem(
                    icon: _buildNavItem("home", isSelected: currentIndex == 0),
                    label: "",
                    backgroundColor: backgroundColor,
                  ),
                  BottomNavigationBarItem(
                    icon:
                        _buildNavItem("search", isSelected: currentIndex == 1),
                    label: "",
                    backgroundColor: backgroundColor,
                  ),
                  BottomNavigationBarItem(
                    icon:
                        _buildNavItem("explore", isSelected: currentIndex == 2),
                    label: "",
                    backgroundColor: backgroundColor,
                  ),
                  BottomNavigationBarItem(
                    icon:
                        _buildNavItem("profile", isSelected: currentIndex == 3),
                    label: "",
                    backgroundColor: backgroundColor,
                  ),
                ],
                // selectedItemColor: const Color(0xFFF6BD00),
                // unselectedItemColor: const Color(0xFFFFFFFF),
                // showSelectedLabels: false,
                // showUnselectedLabels: false,
              ),
            ),
          ],
        )
      ]),
    );
  }

  List<Widget> tabs = [
    HomeTab(),
    SearchTab(),
    ExploreTab(),
    ProfileTab(),
  ];

  Widget _buildNavItem(String imageName, {required bool isSelected}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? Colors.yellow.withOpacity(0.2) : Colors.transparent,
      ),
      padding: const EdgeInsets.all(8.0),
      child: ImageIcon(
        AssetImage("assets/images/$imageName.png"),
        color: isSelected ? Colors.yellow : const Color(0xFFFFFFFF),
      ),
    );
  }
}

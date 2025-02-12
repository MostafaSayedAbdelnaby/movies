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

int currentIndex = 0;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void dispose() {
    currentIndex = 0;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        tabs[currentIndex],
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: const Color(0xFF202020), // Background color
              ),
              child: BottomNavigationBar(
                // backgroundColor: Colors.transparent,
                currentIndex: currentIndex,
                onTap: (value) {
                  setState(() {
                    currentIndex = value;
                  });
                },
                items: [
                  BottomNavigationBarItem(
                    icon: _buildNavItem("home", isSelected: currentIndex == 0),
                    label: "",
                    backgroundColor: const Color(0xFF202020),
                  ),
                  BottomNavigationBarItem(
                    icon:
                        _buildNavItem("search", isSelected: currentIndex == 1),
                    label: "",
                    backgroundColor: const Color(0xFF202020),
                  ),
                  BottomNavigationBarItem(
                    icon:
                        _buildNavItem("explore", isSelected: currentIndex == 2),
                    label: "",
                    backgroundColor: const Color(0xFF202020),
                  ),
                  BottomNavigationBarItem(
                    icon:
                        _buildNavItem("profile", isSelected: currentIndex == 3),
                    label: "",
                    backgroundColor: const Color(0xFF202020),
                  ),
                ],
                selectedItemColor: const Color(0xFFF6BD00),
                // Color for the selected item
                unselectedItemColor: const Color(0xFFFFFFFF),
                // Color for unselected items
                showSelectedLabels: false,
                // Hide labels
                showUnselectedLabels: false,
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
      padding: const EdgeInsets.all(8.0), // Padding around the icon
      child: ImageIcon(
        AssetImage("assets/images/$imageName.png"),
        color: isSelected ? Colors.yellow : const Color(0xFFFFFFFF),
      ),
    );
  }
}
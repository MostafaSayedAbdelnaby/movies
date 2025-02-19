import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/app_colors.dart';
import '../../../../explore_tab/explore_screen.dart';
import '../widgets/home_screen/tabs/profile_tab/profile_tab_screen.dart';
import '../widgets/home_screen/tabs/search_tab/search_tab.dart';
import '../widgets/home_screen/tabs/home_tab/home_tab.dart';

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
                color: AppColors.blackColor, // Background color
              ),
              child: BottomNavigationBar(
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
                    backgroundColor: AppColors.blackColor,
                  ),
                  BottomNavigationBarItem(
                    icon:
                        _buildNavItem("search", isSelected: currentIndex == 1),
                    label: "",
                    backgroundColor: AppColors.blackColor,
                  ),
                  BottomNavigationBarItem(
                    icon:
                        _buildNavItem("explore", isSelected: currentIndex == 2),
                    label: "",
                    backgroundColor: AppColors.blackColor,
                  ),
                  BottomNavigationBarItem(
                    icon:
                        _buildNavItem("profile", isSelected: currentIndex == 3),
                    label: "",
                    backgroundColor: AppColors.blackColor,
                  ),
                ],
                selectedItemColor: AppColors.primaryColor,
                // Color for the selected item
                unselectedItemColor: AppColors.textColor,
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
     ProfileTabScreen(),
  ];

  Widget _buildNavItem(String imageName, {required bool isSelected}) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? AppColors.primaryColor.withOpacity(0.2) : Colors.transparent,
      ),
      padding: const EdgeInsets.all(8.0), // Padding around the icon
      child: ImageIcon(
        AssetImage("assets/images/$imageName.png"),
        color: isSelected ? AppColors.primaryColor : AppColors.textColor,
      ),
    );
  }
}
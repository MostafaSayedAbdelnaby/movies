import 'package:flutter/material.dart';

import 'home_screen/home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  static const tag = "OnBoardingScreen";

  const OnBoardingScreen({super.key});

  @override
  _OnBoardingScreenState createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {

  final PageController _controller = PageController();

  final List<Map<String, String>> onboardingData = [
    {
      "image": "assets/images/onboarding_1.png",
      "title": "Find Your Next Favorite Movie Here",
      "description": "Get access to a huge library of movies to suit all tastes.",
    },
    {
      "image": "assets/images/onboarding_2.png",
      "title": "Discover Movies",
      "description": "Explore a vast selection of movies in all genres.",
    },
    {
      "image": "assets/images/onboarding_3.png",
      "title": "Explore All Genres",
      "description": "Discover movies from every genre, thrilling and exciting to watch.",
    },
    {
      "image": "assets/images/onboarding_4.png",
      "title": "Create Watchlist",
      "description": "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
    },
    {
      "image": "assets/images/onboarding_5.png",
      "title": "Rate, Review, and Learn",
      "description": "Share your thoughts on the movies you've watched. Dive deep into film details and help others discover great movies with your reviews.",
    },
    {
      "image": "assets/images/onboarding_6.png",
      "title": "Start Watching Now",
      "description": "",
    },

  ];

  void _nextPage() {
    if (_controller.page?.toInt() == onboardingData.length - 1) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    } else {
      _controller.nextPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  void _previousPage() {
    if (_controller.page?.toInt() != 0) {
      _controller.previousPage(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: onboardingData.length,
        physics: const BouncingScrollPhysics(),
        reverse: true,
        itemBuilder: (context, index) {
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              Image.asset(
                onboardingData[index]["image"]!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.fill,
              ),
              _buildOnboardingContent(
                onboardingData[index]["title"]!,
                onboardingData[index]["description"]!,
                index,
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildOnboardingContent(String title, String description, int index) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        ),
        color: Colors.black87,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Text(
            description,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    backgroundColor: const Color(0xFFF6BD00),
                  ),
                  child: Text(
                    index <5 ? "Next" : "Finish",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF121312),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              if (index > 1 && index <5)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _previousPage,
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      backgroundColor: const Color(0xFFF6BD00),
                    ),
                    child: const Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Color(0xFF121312),
                      ),
                    ),
                  ),
                )
            ],
          ),
        ],
      ),
    );
  }
}
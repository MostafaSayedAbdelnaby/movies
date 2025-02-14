import 'package:flutter/material.dart';
import 'package:movies_app/profile_tab/up_date_profile.dart';

class ProfileTabBar extends StatelessWidget {
  const ProfileTabBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF212121),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10, left: 10, top: 42),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/image_avatar_1.png',
                      fit: BoxFit.cover,
                      height: 118,
                      width: 118,
                    ),
                    const SizedBox(height: 15),
                    const Text(
                      'Mostafa Sayed',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF)),
                    ),
                  ],
                ),
                const Column(
                  children: [
                    Text(
                      '12',
                      style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.w700,
                          color: Color(0xFFFFFFFF)),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'watchList',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFFFFF),
                      ),
                    )
                  ],
                ),
                const Column(
                  children: [
                    Text(
                      '10',
                      style: TextStyle(
                        fontSize: 34,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'history',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 23),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: SizedBox(
              height: 56,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 2,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, UpdateProfileScreen.tag);
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: const Color(0xFFF6BD00),
                      ),
                      child: const Text('edit Profile',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF121312),
                          )),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    // flex: 1,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        backgroundColor: const Color(0xFFE82626),
                      ),
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'exit',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Color(0xFF121312),
                            ),
                          ),
                          SizedBox(width: 8),
                          Icon(
                            Icons.logout_outlined,
                            color: Color(0xFFFFFFFF),
                            size: 24,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          const TabBar(
            unselectedLabelColor: Color(0xFF121312),
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorWeight: 3,
            indicatorColor: Color(0xFFF6BD00),
            dividerColor: Colors.transparent,
            // labelColor: Color(0xFFFFFFFF),
            labelStyle: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w400,
              color: Color(0xFFFFFFFF),
            ),
            labelPadding: EdgeInsets.only(bottom: 15),
            tabs: [
              Tab(
                icon: ImageIcon(
                  size: 39,
                  color: Color(0xFFF6BD00),
                  AssetImage(
                    'assets/images/Group 20.png',
                  ),
                ),
                child: Text('watch_list'),
              ),
              Tab(
                icon: ImageIcon(
                  size: 39,
                  color: Color(0xFFF6BD00),
                  AssetImage('assets/images/Folder.png'),
                ),
                child: Text('history'),
              )
            ],
          ),
        ],
      ),
    );
  }
}
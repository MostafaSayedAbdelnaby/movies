import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/app_routes.dart';
import 'package:movies_app/core/theme/app_text_theme.dart';
import 'package:movies_app/core/widgets/app_colors.dart';
import 'package:movies_app/features/auth/update_profile_screen/presentation/bloc/update_cubit.dart';
import '../../../../../../auth/update_profile_screen/presentation/bloc/user_data_states.dart';


class ProfileTabBar extends StatelessWidget {

  const ProfileTabBar({super.key,});

  @override
  Widget build(BuildContext context) {
    final userBloc = BlocProvider.of<UserDataCubit>(context);
    // Fetch user data when the widget is built
    userBloc.getUser(userBloc.currentUser?.uid ?? "");

    return BlocBuilder<UserDataCubit, UserDataStates>(
        builder: (context, state) {
          if (state is UserDataLoadingStates) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is UserDataErrorStates) {
            return Center(child: Text("Error: ${state.message}"));
          }
          if (state is UserDataSuccessStates) {
            return Container(
              color: AppColors.profileColor,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        right: 10, left: 10, top: 42),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Image.asset(
                              'assets/images/image_avatar_${(userBloc.updateUserModel?.indexOfImage ?? 0) + 1}.png',
                              fit: BoxFit.cover,
                              height: 118,
                              width: 118,
                            ),
                            const SizedBox(height: 15),
                            Text(
                              userBloc.updateUserModel?.name ?? 'No Name',
                              style: textTheme.bodyMedium,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              '12',
                              style: textTheme.headlineLarge!
                                  .copyWith(
                                  fontSize: 34, fontWeight: FontWeight.w700),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              'watchList',
                              style: textTheme.bodyMedium,
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text('10',
                                style: textTheme.headlineLarge!.copyWith(
                                    fontSize: 34, fontWeight: FontWeight.w700)),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'history',
                              style: textTheme.bodyMedium,
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
                                Navigator.pushNamed(
                                  context, AppRoutes.updateProfileScreenRoute,
                                  /// ******************************
                                  arguments: userBloc.updateUserModel, // send a Model
                                  // that I'm edit it in updateProfileScreenRoute
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor: AppColors.primaryColor,
                              ),
                              child: Text(
                                'edit Profile',
                                style: textTheme.bodyMedium!.copyWith(
                                    color: AppColors.backgroundColor,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                /// ******************************
                                // UserDataCubit(
                                //         updateRepo:
                                //             UpdateRepoImpl(UpdateDataSourceImpl()))
                                userBloc.logOutUser();
                                Navigator.pushNamedAndRemoveUntil(
                                  context,
                                  AppRoutes.loginRoute,
                                      (_) => false,
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                backgroundColor: AppColors.redColor,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'exit',
                                    style: textTheme.bodyMedium!.copyWith(
                                        color: AppColors.backgroundColor,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  const SizedBox(width: 8),
                                  const Icon(
                                    Icons.logout_outlined,
                                    color: AppColors.textColor,
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
                  TabBar(
                    unselectedLabelColor: AppColors.backgroundColor,
                    indicatorSize: TabBarIndicatorSize.tab,
                    indicatorWeight: 3,
                    indicatorColor: AppColors.primaryColor,
                    dividerColor: Colors.transparent,
                    // labelColor: Color(0xFFFFFFFF),
                    labelStyle:
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
                    labelPadding: const EdgeInsets.only(bottom: 15),
                    tabs: const [
                      Tab(
                        icon: ImageIcon(
                          size: 39,
                          color: AppColors.primaryColor,
                          AssetImage(
                            'assets/images/Group 20.png',
                          ),
                        ),
                        child: Text('watch_list'),
                      ),
                      Tab(
                        icon: ImageIcon(
                          size: 39,
                          color: AppColors.primaryColor,
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
          return const SizedBox();
        }
    );
    
    
    //     return BlocBuilder<UserDataCubit, UserDataStates>(
    //     bloc: UserDataCubit(updateRepo: UpdateRepoImpl(UpdateDataSourceImpl())),
    //     builder: (context, state) {
    //       var userBloc = BlocProvider.of<UserDataCubit>(context);
    //       if (state is UserDataLoadingState) {
    //         return const Center(
    //           child: CircularProgressIndicator(
    //             backgroundColor: AppColors.primaryColor,
    //           ),
    //         );
    //       }
    //       if (state is UserDataErrorState) {
    //         return Center(
    //           child: Text(
    //             "Error",
    //             style: textTheme.labelLarge,
    //           ),
    //         );
    //       }
    //       if (state is UserDataSuccessState) {
    //         return Container(
    //           color: AppColors.profileColor,
    //           child: Column(
    //             crossAxisAlignment: CrossAxisAlignment.center,
    //             mainAxisSize: MainAxisSize.min,
    //             children: [
    //               Padding(
    //                 padding:
    //                     const EdgeInsets.only(right: 10, left: 10, top: 42),
    //                 child: Row(
    //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                   children: [
    //                     Column(
    //                       children: [
    //                         Image.asset(
    //                           'assets/images/image_avatar_1.png',
    //                           fit: BoxFit.cover,
    //                           height: 118,
    //                           width: 118,
    //                         ),
    //                         const SizedBox(height: 15),
    //                         Text(
    //                           // 'Mostafa Sayed',
    //                           "${userBloc.updateUserModel?.name}",
    //                           style: textTheme.bodyMedium,
    //                         )
    //                       ],
    //                     ),
    //                     Column(
    //                       children: [
    //                         Text(
    //                           '12',
    //                           style: textTheme.headlineLarge!.copyWith(
    //                               fontSize: 34, fontWeight: FontWeight.w700),
    //                         ),
    //                         const SizedBox(height: 20),
    //                         Text(
    //                           'watchList',
    //                           style: textTheme.bodyMedium,
    //                         )
    //                       ],
    //                     ),
    //                     Column(
    //                       children: [
    //                         Text('10',
    //                             style: textTheme.headlineLarge!.copyWith(
    //                                 fontSize: 34, fontWeight: FontWeight.w700)),
    //                         const SizedBox(
    //                           height: 20,
    //                         ),
    //                         Text(
    //                           'history',
    //                           style: textTheme.bodyMedium,
    //                         ),
    //                       ],
    //                     ),
    //                   ],
    //                 ),
    //               ),
    //               const SizedBox(height: 23),
    //               Padding(
    //                 padding: const EdgeInsets.symmetric(horizontal: 16),
    //                 child: SizedBox(
    //                   height: 56,
    //                   child: Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       Expanded(
    //                         flex: 2,
    //                         child: ElevatedButton(
    //                           onPressed: () {
    //                             Navigator.pushNamed(
    //                               context, AppRoutes.updateProfileScreenRoute,
    //
    //                               /// ******************************
    //                               arguments: userBloc.updateUserModel, // send a Model
    //                               // that I'm edit it in updateProfileScreenRoute
    //                             );
    //                           },
    //                           style: ElevatedButton.styleFrom(
    //                             padding:
    //                                 const EdgeInsets.symmetric(vertical: 12),
    //                             shape: RoundedRectangleBorder(
    //                               borderRadius: BorderRadius.circular(15),
    //                             ),
    //                             backgroundColor: AppColors.primaryColor,
    //                           ),
    //                           child: Text(
    //                             'edit Profile',
    //                             style: textTheme.bodyMedium!.copyWith(
    //                                 color: AppColors.backgroundColor,
    //                                 fontWeight: FontWeight.w400),
    //                           ),
    //                         ),
    //                       ),
    //                       const SizedBox(width: 10),
    //                       Expanded(
    //                         child: ElevatedButton(
    //                           onPressed: () {
    //                             /// ******************************
    //                             UserDataCubit(
    //                                     updateRepo: UpdateRepoImpl(
    //                                         UpdateDataSourceImpl()))
    //                                 .logOutUser();
    //                             Navigator.pushNamedAndRemoveUntil(
    //                               context,
    //                               AppRoutes.loginRoute,
    //                               (_) => false,
    //                             );
    //                           },
    //                           style: ElevatedButton.styleFrom(
    //                             padding:
    //                                 const EdgeInsets.symmetric(vertical: 12),
    //                             shape: RoundedRectangleBorder(
    //                               borderRadius: BorderRadius.circular(15),
    //                             ),
    //                             backgroundColor: AppColors.redColor,
    //                           ),
    //                           child: Row(
    //                             mainAxisAlignment: MainAxisAlignment.center,
    //                             children: [
    //                               Text(
    //                                 'exit',
    //                                 style: textTheme.bodyMedium!.copyWith(
    //                                     color: AppColors.backgroundColor,
    //                                     fontWeight: FontWeight.w400),
    //                               ),
    //                               const SizedBox(width: 8),
    //                               const Icon(
    //                                 Icons.logout_outlined,
    //                                 color: AppColors.textColor,
    //                                 size: 24,
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //               ),
    //               const SizedBox(height: 16),
    //               TabBar(
    //                 unselectedLabelColor: AppColors.backgroundColor,
    //                 indicatorSize: TabBarIndicatorSize.tab,
    //                 indicatorWeight: 3,
    //                 indicatorColor: AppColors.primaryColor,
    //                 dividerColor: Colors.transparent,
    //                 // labelColor: Color(0xFFFFFFFF),
    //                 labelStyle: textTheme.bodyLarge!
    //                     .copyWith(fontWeight: FontWeight.w400),
    //                 labelPadding: const EdgeInsets.only(bottom: 15),
    //                 tabs: const [
    //                   Tab(
    //                     icon: ImageIcon(
    //                       size: 39,
    //                       color: AppColors.primaryColor,
    //                       AssetImage(
    //                         'assets/images/Group 20.png',
    //                       ),
    //                     ),
    //                     child: Text('watch_list'),
    //                   ),
    //                   Tab(
    //                     icon: ImageIcon(
    //                       size: 39,
    //                       color: AppColors.primaryColor,
    //                       AssetImage('assets/images/Folder.png'),
    //                     ),
    //                     child: Text('history'),
    //                   )
    //                 ],
    //               ),
    //             ],
    //           ),
    //         );
    //       }
    //       return const SizedBox();
    //     });
  }
}





// class ProfileTabBar extends StatelessWidget {
//   final UserDataCubit? userBloc;
//   const ProfileTabBar({super.key, this.userBloc});
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       color: AppColors.profileColor,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           Padding(
//             padding: const EdgeInsets.only(right: 10, left: 10, top: 42),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Column(
//                   children: [
//                     Image.asset(
//                       'assets/images/image_avatar_1.png',
//                       fit: BoxFit.cover,
//                       height: 118,
//                       width: 118,
//                     ),
//                     const SizedBox(height: 15),
//                     Text(
//                       // 'Mostafa Sayed',
//                       //userBloc?.updateUserModel?.name ?? 'SSSS',
//                       // userBloc?.getUser(user?.uid ?? "") ?? 'No name',
//                       userBloc?.updateUserModel?.name ?? "ali",
//
//                       style: textTheme.bodyMedium,
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text(
//                       '12',
//                       style: textTheme.headlineLarge!
//                           .copyWith(fontSize: 34, fontWeight: FontWeight.w700),
//                     ),
//                     const SizedBox(height: 20),
//                     Text(
//                       'watchList',
//                       style: textTheme.bodyMedium,
//                     )
//                   ],
//                 ),
//                 Column(
//                   children: [
//                     Text('10',
//                         style: textTheme.headlineLarge!.copyWith(
//                             fontSize: 34, fontWeight: FontWeight.w700)),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     Text(
//                       'history',
//                       style: textTheme.bodyMedium,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 23),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 16),
//             child: SizedBox(
//               height: 56,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Expanded(
//                     flex: 2,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.pushNamed(
//                           context, AppRoutes.updateProfileScreenRoute,
//
//                           /// ******************************
//                           arguments: userBloc?.updateUserModel, // send a Model
//                           // that I'm edit it in updateProfileScreenRoute
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         backgroundColor: AppColors.primaryColor,
//                       ),
//                       child: Text(
//                         'edit Profile',
//                         style: textTheme.bodyMedium!.copyWith(
//                             color: AppColors.backgroundColor,
//                             fontWeight: FontWeight.w400),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 10),
//                   Expanded(
//                     child: ElevatedButton(
//                       onPressed: () {
//                         /// ******************************
//                         // UserDataCubit(
//                         //         updateRepo:
//                         //             UpdateRepoImpl(UpdateDataSourceImpl()))
//                         userBloc?.logOutUser();
//                         Navigator.pushNamedAndRemoveUntil(
//                           context,
//                           AppRoutes.loginRoute,
//                           (_) => false,
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         padding: const EdgeInsets.symmetric(vertical: 12),
//                         shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(15),
//                         ),
//                         backgroundColor: AppColors.redColor,
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text(
//                             'exit',
//                             style: textTheme.bodyMedium!.copyWith(
//                                 color: AppColors.backgroundColor,
//                                 fontWeight: FontWeight.w400),
//                           ),
//                           const SizedBox(width: 8),
//                           const Icon(
//                             Icons.logout_outlined,
//                             color: AppColors.textColor,
//                             size: 24,
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),
//           TabBar(
//             unselectedLabelColor: AppColors.backgroundColor,
//             indicatorSize: TabBarIndicatorSize.tab,
//             indicatorWeight: 3,
//             indicatorColor: AppColors.primaryColor,
//             dividerColor: Colors.transparent,
//             // labelColor: Color(0xFFFFFFFF),
//             labelStyle:
//                 textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w400),
//             labelPadding: const EdgeInsets.only(bottom: 15),
//             tabs: const [
//               Tab(
//                 icon: ImageIcon(
//                   size: 39,
//                   color: AppColors.primaryColor,
//                   AssetImage(
//                     'assets/images/Group 20.png',
//                   ),
//                 ),
//                 child: Text('watch_list'),
//               ),
//               Tab(
//                 icon: ImageIcon(
//                   size: 39,
//                   color: AppColors.primaryColor,
//                   AssetImage('assets/images/Folder.png'),
//                 ),
//                 child: Text('history'),
//               )
//             ],
//           ),
//         ],
//       ),
//     );
//     //     return BlocBuilder<UserDataCubit, UserDataStates>(
//     //     bloc: UserDataCubit(updateRepo: UpdateRepoImpl(UpdateDataSourceImpl())),
//     //     builder: (context, state) {
//     //       var userBloc = BlocProvider.of<UserDataCubit>(context);
//     //       if (state is UserDataLoadingState) {
//     //         return const Center(
//     //           child: CircularProgressIndicator(
//     //             backgroundColor: AppColors.primaryColor,
//     //           ),
//     //         );
//     //       }
//     //       if (state is UserDataErrorState) {
//     //         return Center(
//     //           child: Text(
//     //             "Error",
//     //             style: textTheme.labelLarge,
//     //           ),
//     //         );
//     //       }
//     //       if (state is UserDataSuccessState) {
//     //         return Container(
//     //           color: AppColors.profileColor,
//     //           child: Column(
//     //             crossAxisAlignment: CrossAxisAlignment.center,
//     //             mainAxisSize: MainAxisSize.min,
//     //             children: [
//     //               Padding(
//     //                 padding:
//     //                     const EdgeInsets.only(right: 10, left: 10, top: 42),
//     //                 child: Row(
//     //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //                   children: [
//     //                     Column(
//     //                       children: [
//     //                         Image.asset(
//     //                           'assets/images/image_avatar_1.png',
//     //                           fit: BoxFit.cover,
//     //                           height: 118,
//     //                           width: 118,
//     //                         ),
//     //                         const SizedBox(height: 15),
//     //                         Text(
//     //                           // 'Mostafa Sayed',
//     //                           "${userBloc.updateUserModel?.name}",
//     //                           style: textTheme.bodyMedium,
//     //                         )
//     //                       ],
//     //                     ),
//     //                     Column(
//     //                       children: [
//     //                         Text(
//     //                           '12',
//     //                           style: textTheme.headlineLarge!.copyWith(
//     //                               fontSize: 34, fontWeight: FontWeight.w700),
//     //                         ),
//     //                         const SizedBox(height: 20),
//     //                         Text(
//     //                           'watchList',
//     //                           style: textTheme.bodyMedium,
//     //                         )
//     //                       ],
//     //                     ),
//     //                     Column(
//     //                       children: [
//     //                         Text('10',
//     //                             style: textTheme.headlineLarge!.copyWith(
//     //                                 fontSize: 34, fontWeight: FontWeight.w700)),
//     //                         const SizedBox(
//     //                           height: 20,
//     //                         ),
//     //                         Text(
//     //                           'history',
//     //                           style: textTheme.bodyMedium,
//     //                         ),
//     //                       ],
//     //                     ),
//     //                   ],
//     //                 ),
//     //               ),
//     //               const SizedBox(height: 23),
//     //               Padding(
//     //                 padding: const EdgeInsets.symmetric(horizontal: 16),
//     //                 child: SizedBox(
//     //                   height: 56,
//     //                   child: Row(
//     //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//     //                     children: [
//     //                       Expanded(
//     //                         flex: 2,
//     //                         child: ElevatedButton(
//     //                           onPressed: () {
//     //                             Navigator.pushNamed(
//     //                               context, AppRoutes.updateProfileScreenRoute,
//     //
//     //                               /// ******************************
//     //                               arguments: userBloc.updateUserModel, // send a Model
//     //                               // that I'm edit it in updateProfileScreenRoute
//     //                             );
//     //                           },
//     //                           style: ElevatedButton.styleFrom(
//     //                             padding:
//     //                                 const EdgeInsets.symmetric(vertical: 12),
//     //                             shape: RoundedRectangleBorder(
//     //                               borderRadius: BorderRadius.circular(15),
//     //                             ),
//     //                             backgroundColor: AppColors.primaryColor,
//     //                           ),
//     //                           child: Text(
//     //                             'edit Profile',
//     //                             style: textTheme.bodyMedium!.copyWith(
//     //                                 color: AppColors.backgroundColor,
//     //                                 fontWeight: FontWeight.w400),
//     //                           ),
//     //                         ),
//     //                       ),
//     //                       const SizedBox(width: 10),
//     //                       Expanded(
//     //                         child: ElevatedButton(
//     //                           onPressed: () {
//     //                             /// ******************************
//     //                             UserDataCubit(
//     //                                     updateRepo: UpdateRepoImpl(
//     //                                         UpdateDataSourceImpl()))
//     //                                 .logOutUser();
//     //                             Navigator.pushNamedAndRemoveUntil(
//     //                               context,
//     //                               AppRoutes.loginRoute,
//     //                               (_) => false,
//     //                             );
//     //                           },
//     //                           style: ElevatedButton.styleFrom(
//     //                             padding:
//     //                                 const EdgeInsets.symmetric(vertical: 12),
//     //                             shape: RoundedRectangleBorder(
//     //                               borderRadius: BorderRadius.circular(15),
//     //                             ),
//     //                             backgroundColor: AppColors.redColor,
//     //                           ),
//     //                           child: Row(
//     //                             mainAxisAlignment: MainAxisAlignment.center,
//     //                             children: [
//     //                               Text(
//     //                                 'exit',
//     //                                 style: textTheme.bodyMedium!.copyWith(
//     //                                     color: AppColors.backgroundColor,
//     //                                     fontWeight: FontWeight.w400),
//     //                               ),
//     //                               const SizedBox(width: 8),
//     //                               const Icon(
//     //                                 Icons.logout_outlined,
//     //                                 color: AppColors.textColor,
//     //                                 size: 24,
//     //                               ),
//     //                             ],
//     //                           ),
//     //                         ),
//     //                       ),
//     //                     ],
//     //                   ),
//     //                 ),
//     //               ),
//     //               const SizedBox(height: 16),
//     //               TabBar(
//     //                 unselectedLabelColor: AppColors.backgroundColor,
//     //                 indicatorSize: TabBarIndicatorSize.tab,
//     //                 indicatorWeight: 3,
//     //                 indicatorColor: AppColors.primaryColor,
//     //                 dividerColor: Colors.transparent,
//     //                 // labelColor: Color(0xFFFFFFFF),
//     //                 labelStyle: textTheme.bodyLarge!
//     //                     .copyWith(fontWeight: FontWeight.w400),
//     //                 labelPadding: const EdgeInsets.only(bottom: 15),
//     //                 tabs: const [
//     //                   Tab(
//     //                     icon: ImageIcon(
//     //                       size: 39,
//     //                       color: AppColors.primaryColor,
//     //                       AssetImage(
//     //                         'assets/images/Group 20.png',
//     //                       ),
//     //                     ),
//     //                     child: Text('watch_list'),
//     //                   ),
//     //                   Tab(
//     //                     icon: ImageIcon(
//     //                       size: 39,
//     //                       color: AppColors.primaryColor,
//     //                       AssetImage('assets/images/Folder.png'),
//     //                     ),
//     //                     child: Text('history'),
//     //                   )
//     //                 ],
//     //               ),
//     //             ],
//     //           ),
//     //         );
//     //       }
//     //       return const SizedBox();
//     //     });
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies_app/core/app_routes.dart';
// import 'package:movies_app/core/theme/app_text_theme.dart';
// import 'package:movies_app/core/widgets/app_colors.dart';
// import 'package:movies_app/core/widgets/movies_elevated_button.dart';
// import 'package:movies_app/features/auth/update_profile_screen/data/model/update_user_model.dart';
// import 'package:movies_app/features/auth/update_profile_screen/presentation/bloc/update_cubit.dart';
// import 'package:movies_app/features/auth/update_profile_screen/presentation/bloc/user_data_states.dart';
//
// // ignore: must_be_immutable
// class UpdateButtonBlocListener extends StatelessWidget {
//   final UpdateUserModel? updateUserModel;
//
//   UpdateButtonBlocListener({super.key, this.updateUserModel});
//
//   var nameController = TextEditingController();
//   var phoneController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<UserDataCubit, UserDataStates>(
//       listener: (context, state) {
//         if (state is UpdateOnSuccessStates) {
//           Navigator.pushNamedAndRemoveUntil(
//             context,
//             // AppRoutes.updateProfileScreenRoute,
//             AppRoutes.profileTabScreenRoute,
//             (route) => false,
//           );
//         } else if (state is UpdateOnLoadingStates) {
//           // const Center(child: CircularProgressIndicator());
//         } else if (state is UpdateOnErrorStates) {
//           showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 title: Center(
//                   child: Text(
//                     state.message,
//                     style: textTheme.labelMedium,
//                   ),
//                 ),
//                 actions: [
//                   TextButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       child: const Text("Ok")),
//                 ],
//               );
//             },
//           );
//         }
//       },
//       listenWhen: (previous, current) {
//         return (current is UpdateOnLoadingStates ||
//             current is UpdateOnErrorStates ||
//             current is UpdateOnSuccessStates);
//       },
//       child: MoviesElevatedButton(
//         color: AppColors.primaryColor,
//         child: Text(
//           'update_data',
//           style: textTheme.headlineSmall!
//               .copyWith(color: AppColors.textFormFieldBackgroundColor),
//         ),
//         onPressed: () {
//           UpdateUserModel updatedUser = UpdateUserModel(
//             name: nameController.text,
//             phoneNumber: phoneController.text,
//             indexOfImage: updateUserModel?.indexOfImage,
//           );
//           BlocProvider.of<UserDataCubit>(context).updateUser(updatedUser);
//           // userBloc.updateUser(updatedUser);
//         },
//       ),
//
//
//
//
//       // ElevatedButton(
//       //   onPressed: () {},
//       //   // onPressed: () {
//       //   //   UpdateUserModel updatedUser = UpdateUserModel(
//       //   //     name: nameController.text,
//       //   //     phoneNumber: phoneController.text,
//       //   //     indexOfImage: currentIndex,
//       //   //   );
//       //   //   BlocProvider.of<UserDataCubit>(context).deleteUser();
//       //   //   // BlocProvider.of<UserDataCubit>(context)
//       //   //   //     .updateUser(updatedUser);
//       //   //   userBloc.updateUser(updatedUser);
//       //   // },
//       //   style: ElevatedButton.styleFrom(
//       //     padding: const EdgeInsets.symmetric(vertical: 14),
//       //     shape: RoundedRectangleBorder(
//       //       borderRadius: BorderRadius.circular(16),
//       //     ),
//       //     backgroundColor: AppColors.primaryColor,
//       //   ),
//       //   child: Text(
//       //     'update_data',
//       //     style: textTheme.headlineSmall!.copyWith(
//       //         color: AppColors.textFormFieldBackgroundColor),
//       //   ),
//       // ),
//     );
//   }
// }

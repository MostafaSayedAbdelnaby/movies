// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:movies_app/core/app_routes.dart';
// import 'package:movies_app/core/theme/app_text_theme.dart';
// import 'package:movies_app/core/widgets/app_colors.dart';
// import 'package:movies_app/core/widgets/movies_elevated_button.dart';
// import 'package:movies_app/features/auth/update_profile_screen/presentation/bloc/update_cubit.dart';
// import 'package:movies_app/features/auth/update_profile_screen/presentation/bloc/user_data_states.dart';
//
// class DeleteButtonBlocListener extends StatelessWidget {
//   const DeleteButtonBlocListener({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<UserDataCubit, UserDataStates>(
//       listener: (context, state) {
//         if (state is DeleteOnSuccessStates) {
//           Navigator.pushNamedAndRemoveUntil(
//             context,
//             AppRoutes.loginRoute,
//             (route) => false,
//           );
//         } else if (state is DeleteOnLoadingStates) {
//           const Center(child: CircularProgressIndicator());
//         } else if (state is DeleteOnErrorStates) {
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
//         return (current is DeleteOnLoadingStates ||
//             current is DeleteOnErrorStates ||
//             current is DeleteOnSuccessStates);
//       },
//       child: MoviesElevatedButton(
//         color: AppColors.redColor,
//         child: Text(
//           'delete_account',
//           style: textTheme.headlineSmall,
//         ),
//         onPressed: () {
//           BlocProvider.of<UserDataCubit>(context).deleteUser();
//           // userBloc.deleteUser();
//           Navigator.pushNamedAndRemoveUntil(
//             context,
//             AppRoutes.loginRoute,
//             (context) => false,
//           );
//         },
//       ),
//
//       // ElevatedButton(
//       //   onPressed: () {
//       //     BlocProvider.of<UserDataCubit>(context).deleteUser();
//       //     // userBloc.deleteUser();
//       //     Navigator.pushNamedAndRemoveUntil(
//       //       context,
//       //       AppRoutes.loginRoute,
//       //       (context) => false,
//       //     );
//       //   },
//       //   style: ElevatedButton.styleFrom(
//       //     padding: const EdgeInsets.symmetric(vertical: 14),
//       //     shape: RoundedRectangleBorder(
//       //       borderRadius: BorderRadius.circular(16),
//       //     ),
//       //     backgroundColor: AppColors.redColor,
//       //   ),
//       //   child: Text(
//       //     'delete_account',
//       //     style: textTheme.headlineSmall,
//       //   ),
//       // ),
//     );
//   }
// }

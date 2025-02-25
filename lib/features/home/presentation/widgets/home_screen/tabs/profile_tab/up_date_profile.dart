import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/theme/app_text_theme.dart';
import 'package:movies_app/features/auth/update_profile_screen/data/repositories/update_repo_impl.dart';
import 'package:movies_app/features/auth/update_profile_screen/data/update_data_source/upate_data_source_impl.dart';
import 'package:movies_app/features/auth/update_profile_screen/presentation/bloc/update_cubit.dart';
import 'get_data_bloc_builder.dart';

class UpdateProfileScreen extends StatefulWidget {
  // UpdateUserModel? updateUserModel;

  const UpdateProfileScreen({super.key});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  // int currentIndex = 0;
  // var nameController = TextEditingController();
  // var phoneController = TextEditingController();

  // void _updateAvatarIndex(int index) {
  //   setState(() {
  //     currentIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return UserDataCubit(updateRepo: UpdateRepoImpl(UpdateDataSourceImpl()))
          ..getUser();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('pick_avatar'),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                  child: GetDataBlocBuilder()),
              // const SizedBox(height: 30),
              // Text(
              //   "Reset Password",
              //   style: textTheme.headlineSmall!.copyWith(fontSize: 20),
              // ),
              // const Spacer(),
              // const SizedBox(height: 16),
              // DeleteButtonBlocListener(),
              // const SizedBox(height: 16),
              // UpdateButtonBlocListener(updateUserModel: widget.updateUserModel,),
            ],
          ),
        ),
      ),
    );
  }
}

// Center(
//   child: GestureDetector(
//     // onTap: () async {
//     //   return await showDialog(
//     //       context: context,
//     //       builder: (context) {
//     //         return AvatarImages(
//     //           avatarSelected: (index) {
//     //             setState(() {
//     //               currentIndex = index; // Update local state
//     //             });
//     //           },
//     //           userDataCubit: userBloc, // Pass the existing cubit instance
//     //         );
//     //       });
//     // },
//     onTap: () async {
//       return await showDialog(
//           context: context,
//           builder: (context) {
//             return AvatarImages(
//                 avatarSelected: _updateAvatarIndex);
//           });
//     },
//     child: Padding(
//       padding: const EdgeInsets.symmetric(vertical: 36),
//       child: Image.asset(
//         'assets/images/image_avatar_${currentIndex + 1}.png',
//         fit: BoxFit.contain,
//         height: 150,
//         width: 150,
//       ),
//     ),
//   ),
// ),
// MoviesTextFormField(
//   textEditingController: nameController,
//   labelText: "name",
//   prefixIconImageName: "person",
//   onTap: (value) {
//     if (value == null || value.isEmpty) {
//       return "Name is Required";
//     }
//     return null;
//   },
// ),
// const SizedBox(height: 16),
// MoviesTextFormField(
//   textEditingController: phoneController,
//   labelText: "phone",
//   prefixIconImageName: "phone",
//   onTap: (value) {
//     if (value == null || value.isEmpty) {
//       return 'enter_phone_number';
//     }
//     final phoneRegex =
//         RegExp(r'^(?:\+20|0)?1[0-2,5]{1}[0-9]{8}$');
//     if (!phoneRegex.hasMatch(value)) {
//       return 'please enter a valid phone number';
//     }
//     return null;
//   },
// ),

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/app_routes.dart';
import 'package:movies_app/core/theme/app_text_theme.dart';
import 'package:movies_app/core/widgets/app_colors.dart';
import 'package:movies_app/core/widgets/movies_elevated_button.dart';
import 'package:movies_app/core/widgets/movies_text_form_field.dart';
import 'package:movies_app/features/auth/update_profile_screen/data/model/update_user_model.dart';
import 'package:movies_app/features/auth/update_profile_screen/presentation/bloc/update_cubit.dart';
import 'package:movies_app/widgets/avatar_images.dart';

// ignore: must_be_immutable
class GetDateWidget extends StatefulWidget {
  UpdateUserModel updateUserModel;
  UserDataCubit? userDataCubit;

  GetDateWidget({super.key, required this.updateUserModel, this.userDataCubit});

  @override
  State<GetDateWidget> createState() => _GetDateWidgetState();
}

class _GetDateWidgetState extends State<GetDateWidget> {
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  // int? selectedAvatarIndex;

  late int selectedAvatarIndex;

  @override
  void initState() {
    super.initState();
    selectedAvatarIndex = widget.updateUserModel.indexOfImage ??
        0; // Initialize with the current index
  }

  void updateSelectedAvatar(int index) {
    setState(() {
      selectedAvatarIndex = index; // Update local state
    });
    widget.userDataCubit
        ?.setAvatarImage(index); // Update the avatar index in the cubit
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Center(
          child: GestureDetector(
            onTap: () async {
              return await showDialog(
                  context: context,
                  builder: (context) {
                    return AvatarImages(
                      // Pass the update method to AvatarImage
                      avatarSelected: updateSelectedAvatar,
                    );

                    // return AvatarImages(
                    //         avatarSelected: (index) {
                    //           userDataCubit?.setAvatarImage(index);
                    //         },
                    //         userDataCubit: userDataCubit,
                    //       );
                    //     },
                    // );
                  });
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Image.asset(
                // 'assets/images/image_avatar_${widget.updateUserModel.indexOfImage! + 1}.png',
                'assets/images/image_avatar_${selectedAvatarIndex + 1}.png',
                fit: BoxFit.contain,
                height: 150,
                width: 150,
              ),
            ),
          ),
        ),
        MoviesTextFormField(
          textEditingController: nameController
            ..text = widget.updateUserModel.name,
          labelText: "name",
          prefixIconImageName: "person",
          onTap: (value) {
            if (value == null || value.isEmpty) {
              return "Name is Required";
            }
            return null;
          },
        ),
        const SizedBox(height: 16),
        MoviesTextFormField(
          textEditingController: phoneController
            ..text = widget.updateUserModel.phoneNumber,
          labelText: "phone",
          prefixIconImageName: "phone",
          onTap: (value) {
            if (value == null || value.isEmpty) {
              return 'enter_phone_number';
            }
            final phoneRegex = RegExp(r'^(?:\+20|0)?1[0-2,5]{1}[0-9]{8}$');
            if (!phoneRegex.hasMatch(value)) {
              return 'please enter a valid phone number';
            }
            return null;
          },
        ),
        const SizedBox(height: 30),
        Text(
          "Reset Password",
          style: textTheme.headlineSmall!.copyWith(fontSize: 20),
        ),
        const Spacer(),
        const SizedBox(height: 16),
        MoviesElevatedButton(
          color: AppColors.redColor,
          child: Text(
            'delete_account',
            style: textTheme.headlineSmall,
          ),
          onPressed: () {
            BlocProvider.of<UserDataCubit>(context).deleteUser();
            // widget.userDataCubit?.deleteUser();
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.loginRoute, (route) => false);
          },
        ),
        const SizedBox(height: 16),
        MoviesElevatedButton(
          color: AppColors.primaryColor,
          child: Text(
            'update_data',
            style: textTheme.headlineSmall!
                .copyWith(color: AppColors.textFormFieldBackgroundColor),
          ),
          onPressed: () {
            UpdateUserModel updatedUser = UpdateUserModel(
              name: nameController.text,
              phoneNumber: phoneController.text,
              // send index that I'm selected it from Grid
              indexOfImage: selectedAvatarIndex, // currentIndex
              // indexOfImage: userDataCubit?.currentAvatarIndex ?? updateUserModel.indexOfImage,
            );
            BlocProvider.of<UserDataCubit>(context).updateUser(updatedUser);
            // widget.userDataCubit?.updateUser(updatedUser);
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.profileTabScreenRoute, (route) => false);
          },
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/app_routes.dart';
import 'package:movies_app/core/theme/app_text_theme.dart';
import 'package:movies_app/core/widgets/app_colors.dart';
import 'package:movies_app/core/widgets/movies_text_form_field.dart';
import 'package:movies_app/features/auth/update_profile_screen/data/model/update_user_model.dart';
import 'package:movies_app/features/auth/update_profile_screen/presentation/bloc/user_data_states.dart';
import 'package:movies_app/widgets/avatar_images.dart';
import '../../../../../../auth/update_profile_screen/data/repositories/update_repo_impl.dart';
import '../../../../../../auth/update_profile_screen/data/update_data_source/upate_data_source_impl.dart';
import '../../../../../../auth/update_profile_screen/presentation/bloc/update_cubit.dart';

// ignore: must_be_immutable
class UpdateProfileScreen extends StatefulWidget {
  UpdateUserModel? updateUserModel;

  UpdateProfileScreen({super.key, this.updateUserModel});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  int currentIndex = 0;
  var nameController = TextEditingController();
  var phoneController = TextEditingController();

  void _updateAvatarIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return UserDataCubit(
            updateRepo: UpdateRepoImpl(UpdateDataSourceImpl()));
      },
      child: BlocConsumer<UserDataCubit, UserDataStates>(
        listener: (context, state) {
          if (state is UpdateOnErrorStates) {
            Navigator.pop(context);
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text(
                  'something went wrong',
                ),
                content: Text(
                  state.message,
                ),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text(
                      "ok",
                      style: textTheme.bodyLarge!
                          .copyWith(color: AppColors.backgroundColor),
                    ),
                  ),
                ],
              ),
            );
          } else if (state is UpdateOnLoadingStates) {
            showDialog(
              context: context,
              builder: (_) => const AlertDialog(
                backgroundColor: Colors.transparent,
                title: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              ),
            );
          } else if (state is UpdateOnSuccessStates) {
            Navigator.pushNamedAndRemoveUntil(
                context, AppRoutes.homeScreenRoute, (_) => false);
          }
        },
        builder: (context, state) {
          var userBloc = BlocProvider.of<UserDataCubit>(context);
          return Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('pick_avatar'),
            ),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Center(
                    child: GestureDetector(
                      // onTap: () async {
                      //   return await showDialog(
                      //       context: context,
                      //       builder: (context) {
                      //         return AvatarImages(
                      //           avatarSelected: (index) {
                      //             setState(() {
                      //               currentIndex = index; // Update local state
                      //             });
                      //           },
                      //           userDataCubit: userBloc, // Pass the existing cubit instance
                      //         );
                      //       });
                      // },

                      onTap: () async {
                        return await showDialog(
                            context: context,
                            builder: (context) {
                              return AvatarImages(
                                  avatarSelected: _updateAvatarIndex);
                            });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 36),
                        child: Image.asset(
                          'assets/images/image_avatar_${currentIndex + 1}.png',
                          fit: BoxFit.contain,
                          height: 150,
                          width: 150,
                        ),
                      ),
                    ),
                  ),
                  MoviesTextFormField(
                    textEditingController: nameController,
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
                    textEditingController: phoneController,
                    labelText: "phone",
                    prefixIconImageName: "phone",
                    onTap: (value) {
                      if (value == null || value.isEmpty) {
                        return 'enter_phone_number';
                      }
                      final phoneRegex =
                          RegExp(r'^(?:\+20|0)?1[0-2,5]{1}[0-9]{8}$');
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
                  ElevatedButton(
                    onPressed: () {
                      // BlocProvider.of<UserDataCubit>(context).deleteUser();
                      userBloc.deleteUser();
                      Navigator.pushNamedAndRemoveUntil(
                        context,
                        AppRoutes.loginRoute,
                        (context) => false,
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      backgroundColor: AppColors.redColor,
                    ),
                    child: Text(
                      'delete_account',
                      style: textTheme.headlineSmall,
                    ),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      UpdateUserModel updatedUser = UpdateUserModel(
                        name: nameController.text,
                        phoneNumber: phoneController.text,
                        indexOfImage: currentIndex,
                      );
                      // BlocProvider.of<UserDataCubit>(context)
                      //     .updateUser(updatedUser);
                      userBloc.updateUser(updatedUser);
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      backgroundColor: AppColors.primaryColor,
                    ),
                    child: Text(
                      'update_data',
                      style: textTheme.headlineSmall!.copyWith(
                          color: AppColors.textFormFieldBackgroundColor),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

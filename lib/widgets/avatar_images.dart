import 'package:flutter/material.dart';
import 'package:movies_app/core/widgets/app_colors.dart';
import 'package:movies_app/features/auth/update_profile_screen/data/model/update_user_model.dart';
import 'package:movies_app/features/auth/update_profile_screen/presentation/bloc/update_cubit.dart';

class AvatarImages extends StatefulWidget {
  final Function(int) avatarSelected;

  final UserDataCubit? userDataCubit;
  final UpdateUserModel? updateUserModel;

  const AvatarImages({
    super.key,
    required this.avatarSelected,
    this.userDataCubit,
    this.updateUserModel,
  });

  @override
  State<AvatarImages> createState() => _AvatarImagesState();
}

class _AvatarImagesState extends State<AvatarImages> {
  int? currentIndex;

  @override
  void initState() {
    super.initState();
    // currentIndex = widget
    //     .updateUserModel?.indexOfImage; // Initialize with the current index
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 389,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
              color: AppColors.textFormFieldBackgroundColor,
              borderRadius: BorderRadius.circular(24),
            ),
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              padding: EdgeInsets.zero,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.96),
              itemCount: 9,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index; // Update the current index
                    });

                    /// this is good but don't effect in Container. Dr osama
                    // widget.userDataCubit?.setAvatarImage(index); // Update the avatar index in the cubit
                    widget.avatarSelected(
                        index); // Call the avatarSelected callback
                  },
                  // onTap: () {
                  //   userDataCubit?.setAvatarImage(index);
                  //   avatarSelected(index); // Call the avatarSelected callback
                  // },
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 11, vertical: 9),
                    decoration: BoxDecoration(
                      /// Dr osama
                      // color: currentIndex == widget.updateUserModel?.indexOfImage
                      color: currentIndex == index
                          ? AppColors.primaryColor.withOpacity(0.50)
                          : Colors.transparent,
                      border: Border.all(color: AppColors.primaryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.asset(
                      'assets/images/image_avatar_${index + 1 % 2}.png',
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

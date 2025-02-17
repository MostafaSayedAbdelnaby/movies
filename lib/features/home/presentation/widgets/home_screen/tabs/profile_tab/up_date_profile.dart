import 'package:flutter/material.dart';
import 'package:movies_app/core/theme/app_text_theme.dart';
import 'package:movies_app/core/widgets/app_colors.dart';
import 'package:movies_app/core/widgets/movies_text_form_field.dart';
import 'package:movies_app/widgets/avatar_images.dart';

class UpdateProfileScreen extends StatefulWidget {
  static const String tag = "UpdateProfileScreen";

  const UpdateProfileScreen({super.key});

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
    return Scaffold(
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
                onTap: () async {
                  return await showDialog(
                      barrierDismissible: true,
                      context: context,
                      builder: (context) {
                        return AvatarImages(avatarSelected: _updateAvatarIndex);
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
            const MoviesTextFormField(
                labelText: "name", prefixIconImageName: "person"),
            const SizedBox(height: 16),
            const MoviesTextFormField(
                labelText: "phone", prefixIconImageName: "phone"),
            const SizedBox(height: 30),
            const Text(
              "Reset Password",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFFFFFFF)),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: const Color(0xFFE82626),
              ),
              child: Text(
                'delete_account',
                style: textTheme.headlineSmall,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                backgroundColor: const Color(0xFFF6BD00),
              ),
              child: Text(
                'update_data',
                style: textTheme.headlineSmall!
                    .copyWith(color: AppColors.textFormFieldBackgroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
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
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF121312),
        appBar: AppBar(
          backgroundColor: const Color(0xFF121312),
          centerTitle: true,
          iconTheme: const IconThemeData(
              color: Color(0xFFF6BD00),
          ),
          title: const Text(
            'pick_avatar',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w400,
              color: Color(0xFFF6BD00),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 16),
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
                          return AvatarImages(
                              avatarSelected: _updateAvatarIndex);
                        });
                  },                  child: Padding(
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
              TextField(
                controller: nameController,
                autocorrect: true,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFFFFFFF),
                ),
                decoration: InputDecoration(
                  fillColor: const Color(0xff282A28),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        const BorderSide(width: 1, color: Color(0xFF282A28)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        const BorderSide(width: 1, color: Color(0xFF282A28)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        const BorderSide(width: 1, color: Color(0xFF282A28)),
                  ),
                  labelText: "name",
                  labelStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFFFFFF),
                  ),
                  prefixIcon: const Icon(
                    Icons.person,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: phoneController,
                autocorrect: true,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFFFFFFFF),
                ),
                decoration: InputDecoration(
                  fillColor: const Color(0xff282A28),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        const BorderSide(width: 1, color: Color(0xFF282A28)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        const BorderSide(width: 1, color: Color(0xFF282A28)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide:
                        const BorderSide(width: 1, color: Color(0xFF282A28)),
                  ),
                  labelText: "phone",
                  labelStyle: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Color(0xFFFFFFFF),
                  ),
                  prefixIcon: const Icon(
                    Icons.phone,
                    color: Color(0xFFFFFFFF),
                  ),
                ),
              ),
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
                child: const Text(
                  'delete_account',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFFFFFFFF)),
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
                child: const Text(
                  'update_data',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF121312)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

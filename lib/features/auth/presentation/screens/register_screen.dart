import 'package:flutter/material.dart';
import 'package:movies_app/core/app_routes.dart';
import 'package:movies_app/widgets/avatar_Carousel_widget.dart';
import '../../../../core/theme/app_text_theme.dart';
import '../../../../core/widgets/app_colors.dart';
import '../../../../core/widgets/movies_elevated_button.dart';
import '../../../../core/widgets/movies_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  final rePasswordController = TextEditingController();

  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(children: [
              const AvatarCarouselWidget(),
              Text(
                "Avatar",
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              MoviesTextFormField(
                textEditingController: nameController,
                prefixIconImageName: 'name',
                labelText: 'Name',
                onTap: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please_enter_name';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              MoviesTextFormField(
                textEditingController: emailController,
                prefixIconImageName: 'email',
                labelText: 'Email',
                onTap: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please_enter_email';
                  }
                  final emailRegex = RegExp(
                      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                  if (!emailRegex.hasMatch(value)) {
                    return 'please_enter_valid_email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              MoviesTextFormField(
                textEditingController: passwordController,
                prefixIconImageName: 'password',
                labelText: 'password',
                suffixIconImageName: 'show_password',
                onTap: (value) {
                  if (value == null || value.isEmpty) {
                    return 'please_enter_password';
                  }
                  if (value.length < 8) {
                    return 'password_must_be_8_characters';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              MoviesTextFormField(
                textEditingController: rePasswordController,
                prefixIconImageName: 'password',
                labelText: 'Confirm Password',
                suffixIconImageName: 'show_password',
                onTap: (value) {
                  if (value == null || value.isEmpty) {
                    return 'must_reenter_password';
                  }
                  if (value.length < 8) {
                    return 'password_must_be_8_characters';
                  }
                  if (passwordController.text != value) {
                    return 'passwords_do_not_match';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              MoviesTextFormField(
                textEditingController: phoneNumberController,
                onTap: (value) {
                  if (value == null || value.isEmpty) {
                    return 'enter_phone_number';
                  }
                  final phoneRegex =
                  RegExp(r'^(?:\+20|0)?1[0-2,5]{1}[0-9]{8}$');
                  if (!phoneRegex.hasMatch(value)) {
                    return 'please_enter_a_valid_phone_number';
                  }
                  return null;
                },
                prefixIconImageName: 'phone',
                labelText: 'Phone',
              ),
              const SizedBox(height: 16),
              MoviesElevatedButton(
                backgroundColor: AppColors.primaryColor,
                child: Text(
                  'Create Account',
                  style: textTheme.labelLarge!
                      .copyWith(color: AppColors.backgroundColor),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, AppRoutes.loginRoute);
                },
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account ? ',
                    style: textTheme.labelMedium
                        ?.copyWith(fontSize: 14, color: AppColors.textColor),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.loginRoute);
                    },
                    child: Text(
                      'Login',
                      style: textTheme.labelMedium?.copyWith(fontSize: 14),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20),
            ]),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:movies_app/core/app_routes.dart';
import 'package:movies_app/widgets/avatar_Carousel_widget.dart';
import '../core/theme/app_text_theme.dart';
import '../core/widgets/app_colors.dart';
import '../core/widgets/movies_elevated_button.dart';
import '../core/widgets/movies_text_form_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

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
              AvatarCarouselWidget(),
              Text(
                "Avatar",
                textAlign: TextAlign.center,
                style: textTheme.headlineSmall,
              ),
              const SizedBox(height: 10),
              MoviesTextFormField(
                prefixIconImageName: 'name',
                labelText: 'Name',
              ),
              const SizedBox(height: 16),
              MoviesTextFormField(
                prefixIconImageName: 'email',
                labelText: 'Email',
              ),
              const SizedBox(height: 16),
              MoviesTextFormField(
                prefixIconImageName: 'password',
                labelText: 'password',
                suffixIconImageName: 'show_password',
              ),
              const SizedBox(height: 16),
              MoviesTextFormField(
                prefixIconImageName: 'password',
                labelText: 'Confirm Password',
                suffixIconImageName: 'show_password',
              ),
              const SizedBox(height: 16),
              MoviesTextFormField(
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
              const SizedBox(
                height: 20
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

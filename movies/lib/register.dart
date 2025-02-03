import 'package:flutter/material.dart';
import 'package:movies_app/app_resources/app_colors.dart';
import 'package:movies_app/app_resources/widget/movies_elevated_button.dart';
import 'package:movies_app/app_resources/widget/movies_text_form_field.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(children: <Widget>[
          MoviesTextFormField(
            prefixIconImageName: 'name',
            labeText: 'Name',
          ),
          const SizedBox(height: 24),
          MoviesTextFormField(
            prefixIconImageName: 'Email',
            labeText: 'Email',
          ),
          const SizedBox(height: 24),
          MoviesTextFormField(
            prefixIconImageName: 'password',
            labeText: 'password',
            suffixIconImageName: 'show_password',
          ),
          const SizedBox(height: 24),
          MoviesTextFormField(
            prefixIconImageName: 'password',
            labeText: 'Confirm Password',
            suffixIconImageName: 'show_password',
          ),
          const SizedBox(height: 24),
          MoviesTextFormField(
            prefixIconImageName: 'phone',
            labeText: 'Phone',
          ),
          const SizedBox(height: 24),
          MoviesElevatedButton(
            backgroundColor: AppColors.primaryColor,
            child: Text(
              'Create Account',
              style: Theme.of(context)
                  .textTheme
                  .labelLarge!
                  .copyWith(color: AppColors.backgroundColor),
            ),
            onPressed: () {},
          ),
          const SizedBox(height: 18),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Already have an account ? ',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontSize: 14,color: AppColors.textColor),
              ),
              Text(
                'Login',
                style: Theme.of(context)
                    .textTheme
                    .labelMedium
                    ?.copyWith(fontSize: 14),
              )
            ],
          ),
          const SizedBox(height: 24,),
        ]),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/app_routes.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_colors.dart';
import '../../../../../core/widgets/movies_elevated_button.dart';
import '../../../../../core/widgets/movies_text_form_field.dart';
import '../../data/data_source/login_data_source_impl.dart';
import '../../data/repositories/login_repo_impl.dart';
import '../bloc/login_cubit.dart';
import '../bloc/login_states.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final passwordController = TextEditingController();
  final emailController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return LoginCubit(LoginRepoImpl(LoginDataSourceImpl()));
      },
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {
          if (state is LoginOnSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.homeScreenRoute,
              (route) => false,
            );
          } else if (state is LoginOnErrorState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Center(
                    child: Text(
                      state.message,
                      style: textTheme.labelMedium,
                    ),
                  ),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text("Ok")),
                  ],
                );
              },
            );
          }
        },
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            // لن يتغير حجم الواجهة عند ظهور لوحة المفاتيح
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Form(
                key: formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                          height: 300,
                          child: Image.asset("assets/images/play_login.png")),
                      MoviesTextFormField(
                        textEditingController: emailController,
                        prefixIconImageName: 'email',
                        labelText: 'Email',
                        onTap: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please_enter_your_email';
                          }
                          final emailRegex = RegExp(
                              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                          if (!emailRegex.hasMatch(value)) {
                            return 'please_enter_valid_email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 20),
                      MoviesTextFormField(
                        textEditingController: passwordController,
                        prefixIconImageName: 'password',
                        labelText: 'password',
                        suffixIconImageName: 'show password',
                        onTap: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter password';
                          }
                          if (value.length < 6) {
                            return 'password must be 6 characters';
                          }
                          return null;
                        }, // convert to Icons
                      ),
                      const SizedBox(height: 16),
                      Text(
                        "Forget Password ?",
                        textAlign: TextAlign.end,
                        style: textTheme.labelMedium,
                      ),
                      const SizedBox(height: 20),
                      MoviesElevatedButton(
                        color: AppColors.primaryColor,
                        child: Text("login",
                            style: textTheme.bodyMedium!.copyWith(
                                color: AppColors.textFormFieldBackgroundColor)),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<LoginCubit>(context).login(
                                email: emailController.text,
                                password: passwordController.text);
                          }
                        },
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Don’t Have Account ? ',
                            style: textTheme.labelMedium?.copyWith(
                                fontSize: 14, color: AppColors.textColor),
                          ),
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, AppRoutes.registerRoute);
                            },
                            child: Text(
                              'Create One',
                              style: textTheme.labelMedium,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Expanded(
                            child: Divider(
                              color: AppColors.primaryColor,
                              endIndent: 20,
                              indent: 20,
                            ),
                          ),
                          Text('OR', style: textTheme.labelMedium),
                          const Expanded(
                            child: Divider(
                              color: AppColors.primaryColor,
                              endIndent: 20,
                              indent: 20,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      MoviesElevatedButton(
                        color: AppColors.primaryColor,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              "assets/icons/icon _google.png",
                            ),
                            const SizedBox(width: 10),
                            Text('Login With Google',
                                style: textTheme.bodyMedium!.copyWith(
                                    color: AppColors
                                        .textFormFieldBackgroundColor)),
                          ],
                        ),
                      ),
                    ]),
              ),
            ),
          );
        },
      ),
    );
  }
}

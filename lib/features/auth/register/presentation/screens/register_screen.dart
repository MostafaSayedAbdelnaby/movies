import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/app_routes.dart';
import 'package:movies_app/features/auth/register/data/repositories/register_repo_impl.dart';
import 'package:movies_app/features/auth/register/presentation/bloc/auth_cubit.dart';
import 'package:movies_app/features/auth/register/presentation/bloc/register_state.dart';
import 'package:movies_app/widgets/avatar_Carousel_widget.dart';
import '../../../../../core/theme/app_text_theme.dart';
import '../../../../../core/widgets/app_colors.dart';
import '../../../../../core/widgets/movies_elevated_button.dart';
import '../../../../../core/widgets/movies_text_form_field.dart';
import '../../data/data_sources/data_source_impl.dart';
import '../../data/models/user_model.dart';

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

  late final int indexOfImage;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return RegisterCubit(registerRepo: RegisterRepoImpl(DataSourceImpl()));
      },
      child: BlocListener<RegisterCubit, RegisterStates>(
        listener: (BuildContext context, state) {
          if (state is RegisterOnSuccessState) {
            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.loginRoute,
              (route) => false,
            );
          } else if (state is RegisterOnErrorState) {
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text(
                    state.message,
                    style: textTheme.headlineLarge,
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
        child: Scaffold(
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
                  Text("Avatar",
                      textAlign: TextAlign.center,
                      style: textTheme.headlineSmall),
                  const SizedBox(height: 10),
                  MoviesTextFormField(
                    textEditingController: nameController,
                    prefixIconImageName: 'name',
                    labelText: 'Name',
                    onTap: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name is Required";
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
                        return "Email is Required";
                      }
                      final bool emailValid =
                          RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9]+@[gmail]+\.[com]+")
                              .hasMatch(value);
                      if (!emailValid) {
                        return "Email is Required with RegExp";
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
                        return "Password is Required";
                      }
                      if (value.length < 6) {
                        return "Password should be at least 6 Char ";
                      }
                      if (passwordController.text != value) {
                        return "Password not matched ";
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
                        return 'Password is Required';
                      }
                      if (value.length < 6) {
                        return 'Password should be at least 6 Char';
                      }
                      if (passwordController.text != value) {
                        return 'Password not matched';
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
                    color: AppColors.primaryColor,
                    child: Text(
                      'Create Account',
                      style: textTheme.labelLarge!
                          .copyWith(color: AppColors.backgroundColor),
                    ),
                    onPressed: () {
                      // currentState means in the click state
                      if (formKey.currentState!.validate()) {
                        // context.read<RegisterCubit>().addUser(
                        //     UserModel(
                        //         name: nameController.text,
                        //         id: "",
                        //         email: emailController.text,
                        //         indexOfImage: indexOfImage,
                        //         password: passwordController.text,
                        //         phoneNumber: phoneNumberController.text));
                      }
                    },
                  ),
                  const SizedBox(height: 14),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account ? ',
                        style: textTheme.labelMedium?.copyWith(
                            fontSize: 14, color: AppColors.textColor),
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
        ),
      ),
    );
  }
}

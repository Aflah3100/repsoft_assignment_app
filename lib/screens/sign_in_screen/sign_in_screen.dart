// ignore_for_file: use_build_context_synchronously

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:repsoft_assignment_app/constants/assets.dart';
import 'package:repsoft_assignment_app/firebase/firebase_auth/firebase_auth_functions.dart';
import 'package:repsoft_assignment_app/models/user_model.dart';
import 'package:repsoft_assignment_app/providers/auth_screen_provider.dart';
import 'package:repsoft_assignment_app/screens/select_courier_screen/select_courier_screen.dart';
import 'package:repsoft_assignment_app/screens/sign_in_screen/widgets/sign_in_widgets.dart';
import 'package:repsoft_assignment_app/screens/sign_up_screen/sign_up_screen.dart';
import 'package:repsoft_assignment_app/utils/app_colors.dart';
import 'package:repsoft_assignment_app/utils/app_text_styles.dart';

class SignInScreen extends StatelessWidget {
  SignInScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Sign In',
          style: AppTextStyles.supermercadoOneTextStyle(
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Sign-in-image
                SizedBox(
                  child: Image.asset(
                    Assets.signInImage,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(
                  height: 20,
                ),
                //Welcome-text
                GradientText(
                    text: 'Welcome Back Ashutosh!',
                    style: AppTextStyles.supermercadoOneTextStyle(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w400,
                        fontSize: 30),
                    gradient: const LinearGradient(
                        colors: [Color(0xffFB331A), Color(0xffF76C2E)])),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Sign in to continue',
                  style: AppTextStyles.poppinsTextStyle(
                      color: AppColors.lightGreyTextColor,
                      fontWeight: FontWeight.w500,
                      fontSize: 18),
                ),
                const SizedBox(
                  height: 20,
                ),
                //Sign-in-textfield
                Material(
                  color: Colors.white,
                  elevation: 10,
                  borderRadius: BorderRadius.circular(25),
                  child: Container(
                    height: 382,
                    padding: const EdgeInsets.only(
                        left: 20, right: 20, top: 30, bottom: 5),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(25)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        AuthenticationTextField(
                          controller: emailController,
                          label: 'email',
                          icon: Icons.email,
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        AuthenticationTextField(
                          controller: passwordController,
                          label: 'password',
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true,
                          icon: Icons.lock,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CheckBoxWidget(
                              flex: false,
                              label: 'Remember me',
                              labelStyle: AppTextStyles.ttChocolateTextStyle(
                                  color: AppColors.lightGreyTextColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ),
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Forgot Password ?',
                                  style: AppTextStyles.ttChocolateTextStyle(
                                      color: AppColors.lightGreyTextColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 15),
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),

                        //Authentication Button
                        Selector<AuthScreenProvider, bool>(
                            selector: (context, provider) =>
                                provider.getLadingStatus(),
                            builder: (contex, isLoading, child) {
                              return AuthenticationButton(
                                  label: 'Sign In',
                                  onTap: () async {
                                    if (isLoading) return;
                                    context
                                        .read<AuthScreenProvider>()
                                        .setLoadingStatus(true);
                                    try {
                                      if (verifySigninDetails()) {
                                        final authResult =
                                            await FirebaseAuthFunctions
                                                .instance
                                                .authenticateUserUsingEmail(
                                                    emailId:
                                                        emailController.text,
                                                    password: passwordController
                                                        .text);
                                        if (authResult is UserModel) {
                                          //Sign-in-sucess
                                          Navigator.pushReplacement(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (_) =>
                                                      const SelectCourierScreen()));
                                        } else if (authResult
                                            is FirebaseAuthException) {
                                          showErrorToast(authResult.message ??
                                              'Error Signing In');
                                        } else if (authResult is String) {
                                          showErrorToast(authResult);
                                        }
                                      }
                                    } catch (e) {
                                      showErrorToast('Error Signing In');
                                    } finally {
                                      context
                                          .read<AuthScreenProvider>()
                                          .setLoadingStatus(false);
                                    }
                                  },
                                  isLoading: isLoading);
                            }),

                        const SizedBox(
                          height: 10,
                        ),

                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignUpScreen()));
                            },
                            child: Text(
                              'Create a new account',
                              style: AppTextStyles.poppinsTextStyle(
                                  color: AppColors.lightOrangeColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15),
                            ))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool verifySigninDetails() {
    if (emailController.text.isEmpty) {
      showErrorToast('Email id can\'t be empty');
      return false;
    } else if (!isValidEmail(emailController.text)) {
      showErrorToast('Enter valid email address');
      return false;
    } else if (passwordController.text.isEmpty) {
      showErrorToast('Please enter your password');
      return false;
    } else {
      return true;
    }
  }

  void showErrorToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        gravity: ToastGravity.BOTTOM);
  }

  bool isValidEmail(String email) {
    final RegExp emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    return emailRegex.hasMatch(email);
  }
}

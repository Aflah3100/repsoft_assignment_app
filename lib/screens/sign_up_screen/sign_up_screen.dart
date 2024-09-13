// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:repsoft_assignment_app/constants/assets.dart';
import 'package:repsoft_assignment_app/firebase/firebase_auth/firebase_auth_functions.dart';
import 'package:repsoft_assignment_app/models/user_model.dart';
import 'package:repsoft_assignment_app/providers/auth_screen_provider.dart';
import 'package:repsoft_assignment_app/screens/select_courier_screen/select_courier_screen.dart';
import 'package:repsoft_assignment_app/screens/sign_in_screen/sign_in_screen.dart';
import 'package:repsoft_assignment_app/screens/sign_in_screen/widgets/sign_in_widgets.dart';
import 'package:repsoft_assignment_app/screens/sign_up_screen/widgets/sign_up_widgets.dart';
import 'package:repsoft_assignment_app/utils/app_colors.dart';
import 'package:repsoft_assignment_app/utils/app_text_styles.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confimPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          'Sign Up',
          style: AppTextStyles.supermercadoOneTextStyle(
              color: AppColors.greyTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.only(top: 20),
        padding: const EdgeInsets.only(left: 20, right: 30, bottom: 50),
        child: Material(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          elevation: 10,
          child: Container(
            margin: const EdgeInsets.all(20),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            // padding: const EdgeInsets.all(10),
            width: double.maxFinite,
            height: double.maxFinite,
            child: SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.75,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Your existing widgets
                      CircleAvatar(
                        radius: 80,
                        backgroundColor: AppColors.circleAvatatColor,
                        child: Center(
                          child: Image.asset(Assets.cameraImage),
                        ),
                      ),
                      const SizedBox(height: 20),
                      AuthenticationTextField(
                          controller: nameController,
                          label: 'Full Name',
                          keyboardType: TextInputType.name,
                          obscureText: false),
                      const SizedBox(height: 10),
                      AuthenticationTextField(
                          controller: phoneController,
                          label: 'Phone number',
                          keyboardType: TextInputType.number,
                          obscureText: false),
                      const SizedBox(height: 10),
                      AuthenticationTextField(
                          controller: emailController,
                          label: 'Email',
                          keyboardType: TextInputType.emailAddress,
                          obscureText: false),
                      const SizedBox(height: 10),
                      AuthenticationTextField(
                          controller: passwordController,
                          label: "Password",
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true),
                      const SizedBox(height: 10),
                      AuthenticationTextField(
                          controller: confimPasswordController,
                          label: 'Confirm Password',
                          keyboardType: TextInputType.visiblePassword,
                          obscureText: true),
                      const SizedBox(height: 30),
                      CheckBoxWidget(
                        flex: true,
                        label:
                            'By creating an account you agree to our terms of service and privacy policy',
                        labelStyle: AppTextStyles.poppinsTextStyle(
                            color: AppColors.lightGreyTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      const SizedBox(height: 20),
                      //Sign-up-button
                      Selector<AuthScreenProvider, bool>(
                          selector: (context, provider) =>
                              provider.getLadingStatus(),
                          builder: (context, isLoading, child) {
                            return AuthenticationButtonRounded(
                                label: 'Sign Up',
                                onTap: () async {
                                  if (isLoading) return;
                                  context
                                      .read<AuthScreenProvider>()
                                      .setLoadingStatus(true);
                                  try {
                                    if (verifySignUpDetails()) {
                                      final userModel = UserModel(
                                          fullName: nameController.text,
                                          emailId: emailController.text,
                                          mobileNo: phoneController.text);

                                      final authResult =
                                          await FirebaseAuthFunctions
                                              .instance
                                              .registerNewUserUsingEmail(
                                                  userModel: userModel,
                                                  password:
                                                      passwordController.text);

                                      if (authResult is bool) {
                                        //Register-success
                                        Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    const SelectCourierScreen()));
                                      } else if (authResult is String) {
                                        showErrorToast(authResult);
                                      }
                                    }
                                  } catch (e) {
                                    showErrorToast('Error Signin Up!');
                                  } finally {
                                    context
                                        .read<AuthScreenProvider>()
                                        .setLoadingStatus(false);
                                  }
                                },
                                isLoading: isLoading);
                          }),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: AppTextStyles.poppinsTextStyle(
                                color: AppColors.lightGreyTextColor,
                                fontSize: 13,
                                fontWeight: FontWeight.w400),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => SignInScreen()));
                            },
                            child: Text(
                              'Sign In',
                              style: AppTextStyles.poppinsTextStyle(
                                  color: AppColors.primaryColor,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      )),
    );
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

  bool verifySignUpDetails() {
    if (nameController.text.isEmpty) {
      showErrorToast('Name can\'t be empty');
      return false;
    } else if (emailController.text.isEmpty) {
      showErrorToast('email address cant be empty');
      return false;
    } else if (!isValidEmail(emailController.text)) {
      showErrorToast('Enter a valid email address');
      return false;
    } else if (phoneController.text.isEmpty) {
      showErrorToast('Mobile number cant be empty');
      return false;
    } else if (phoneController.text.length < 10) {
      showErrorToast('Enter valid phone number');
      return false;
    } else if (passwordController.text.isEmpty) {
      showErrorToast('Password can\'t be empty');
      return false;
    } else if (passwordController.text.length < 8) {
      showErrorToast('Password mut be of length >=8');
      return false;
    } else if (confimPasswordController.text.isEmpty) {
      showErrorToast('Confirm your entered password');
      return false;
    } else if (passwordController.text != confimPasswordController.text) {
      showErrorToast('Password and confirm password doesn\'t match');
      return false;
    } else {
      return true;
    }
  }
}

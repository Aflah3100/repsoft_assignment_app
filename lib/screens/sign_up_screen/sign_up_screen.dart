import 'package:flutter/material.dart';
import 'package:repsoft_assignment_app/constants/assets.dart';
import 'package:repsoft_assignment_app/screens/sign_in_screen/widgets/sign_in_widgets.dart';
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
        padding: const EdgeInsets.only(left: 20, right: 30, bottom: 50),
        child: Material(
          borderRadius: BorderRadius.circular(25),
          color: Colors.white,
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(25)),
            padding: const EdgeInsets.all(20),
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
                        label:
                            'By creating an account you agree to our terms of service and privacy policy',
                        labelStyle: AppTextStyles.poppinsTextStyle(
                            color: AppColors.lightGreyTextColor,
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                      const SizedBox(height: 20),
                      AuthenticationButtonRounded(
                          label: 'Sign Up', onTap: () {}, isLoading: false),
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
                            onTap: () {},
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
}

class AuthenticationButtonRounded extends StatelessWidget {
  const AuthenticationButtonRounded({
    super.key,
    required this.label,
    required this.onTap,
    required this.isLoading,
  });
  final String label;
  final void Function() onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        height: 60,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppColors.primaryColor,
            gradient: const LinearGradient(
                colors: [Color(0xffFB331A), Color(0xffF76C2E)])),
        child: Center(
          child: (!isLoading)
              ? Text(
                  label,
                  style: AppTextStyles.supermercadoOneTextStyle(
                      color: Colors.black,
                      fontSize: 22,
                      fontWeight: FontWeight.w400),
                )
              : const CircularProgressIndicator(
                  color: Colors.black,
                ),
        ),
      ),
    );
  }
}

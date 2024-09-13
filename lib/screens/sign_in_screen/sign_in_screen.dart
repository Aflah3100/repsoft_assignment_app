import 'package:flutter/material.dart';
import 'package:repsoft_assignment_app/constants/assets.dart';
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
                            const CheckBoxWidget(
                              label: 'Remember me',
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
                        AuthenticationButton(
                            label: 'Sign In', onTap: () {}, isLoading: false),

                        const SizedBox(
                          height: 10,
                        ),

                        TextButton(
                            onPressed: () {
                              Navigator.push(
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
}

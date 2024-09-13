
import 'package:flutter/material.dart';
import 'package:repsoft_assignment_app/utils/app_colors.dart';
import 'package:repsoft_assignment_app/utils/app_text_styles.dart';

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

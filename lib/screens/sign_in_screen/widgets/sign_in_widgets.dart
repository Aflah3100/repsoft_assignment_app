import 'package:flutter/material.dart';
import 'package:repsoft_assignment_app/utils/app_colors.dart';
import 'package:repsoft_assignment_app/utils/app_text_styles.dart';

class AuthenticationButton extends StatelessWidget {
  const AuthenticationButton({
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
            borderRadius: BorderRadius.circular(10),
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

class AuthenticationTextField extends StatelessWidget {
  const AuthenticationTextField({
    super.key,
    required this.controller,
    required this.label,
    this.icon,
    required this.keyboardType,
    required this.obscureText,
  });
  final TextEditingController controller;
  final String label;
  final IconData? icon;
  final TextInputType keyboardType;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: AppColors.lightGreenColor),
      child: Center(
        child: TextFormField(
          keyboardType: keyboardType,
          obscureText: obscureText,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: label,
              prefixIcon: Icon(
                icon,
                color: AppColors.darkGreenIconColor,
              ),
              hintStyle: AppTextStyles.ttChocolateTextStyle(
                  color: AppColors.textFieldGreyColor)),
        ),
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText({
    super.key,
    required this.text,
    required this.style,
    required this.gradient,
  });

  final Gradient gradient;
  final TextStyle style;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(
        text,
        style: style.copyWith(color: Colors.white),
      ),
    );
  }
}

class CheckBoxWidget extends StatefulWidget {
  CheckBoxWidget({super.key, required this.label, this.labelStyle, required this.flex});

  final String label;
  final TextStyle? labelStyle;
  final bool flex;

  @override
  _CheckBoxWidgetState createState() => _CheckBoxWidgetState();
}

class _CheckBoxWidgetState extends State<CheckBoxWidget> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(
            activeColor: AppColors.darkGreenIconColor,
            value: isChecked,
            onChanged: (bool? value) {
              setState(() {
                isChecked = value ?? false;
              });
            },
          ),
          (!widget.flex)
              ? Text(
                  widget.label,
                  style: widget.labelStyle,
                )
              : Flexible(
                  child: Text(
                  widget.label,
                  style: widget.labelStyle,
                )),
        ],
      ),
    );
  }
}

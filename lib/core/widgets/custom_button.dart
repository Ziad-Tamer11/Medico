import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, this.onPressed, required this.text});

  final void Function()? onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: AppColor.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(32),
          ),
        ),
        child: Text(
          text,
          style: TextStyles.font16Bold.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    this.hintText,
    this.suffixIcon,
    required this.keyboardType,
    this.onSaved,
    this.obscureText = false,
  });

  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Enter text here';
        }
        return null;
      },
      keyboardType: keyboardType,
      onSaved: onSaved,
      obscureText: obscureText,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF9FAFB),
        hintText: hintText,
        hintStyle: TextStyles.font16Regular.copyWith(
          color: const Color(0xFFB2BCC8),
        ),
        errorStyle: TextStyles.font16Regular.copyWith(color: AppColor.red),
        suffixIcon: suffixIcon,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder().copyWith(
          borderSide: BorderSide(color: AppColor.primary),
        ),
        errorBorder: buildBorder().copyWith(
          borderSide: BorderSide(color: AppColor.red),
        ),
      ),
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(16),
      borderSide: const BorderSide(color: Color(0xFFF4F4F6)),
    );
  }
}

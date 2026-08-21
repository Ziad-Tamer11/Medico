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
    this.enabled = true, // ← جديد
  });

  final TextEditingController? controller;
  final String? hintText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final void Function(String?)? onSaved;
  final bool obscureText;
  final bool enabled; // ← جديد

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled, // ← جديد
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
        fillColor: enabled
            ? const Color(0xFFF9FAFB)
            : const Color(0xFFF0F0F0), // ← لون مختلف شوية وهو disabled
        hintText: hintText,
        hintStyle: TextStyles.font16Regular.copyWith(
          color: const Color(0xFFB2BCC8),
        ),
        errorStyle: TextStyles.font16Regular.copyWith(color: AppColor.red),
        suffixIcon: suffixIcon,
        border: buildBorder(),
        enabledBorder: buildBorder(),
        disabledBorder: buildBorder(), // ← جديد
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

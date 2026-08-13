import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/widgets/custom_text_form_field.dart';
import 'package:medico/features/auth/presentation/views/widgets/custom_text.dart';

class NameAndTextField extends StatelessWidget {
  const NameAndTextField({
    super.key,
    required this.title,
    required this.value,
    required this.keyboardType,
    this.suffixIcon,
    this.obscureText = false,
  });
  final String title, value;
  final TextInputType keyboardType;
  final Widget? suffixIcon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: kHorizontalPadding,
        left: kHorizontalPadding,
        top: kHorizontalPadding,
      ),
      child: Column(
        children: [
          CustomText(text: title),
          SizedBox(height: 16),
          CustomTextFormField(
            hintText: value,
            keyboardType: keyboardType,
            obscureText: obscureText,
            suffixIcon: suffixIcon,
          ),
        ],
      ),
    );
  }
}

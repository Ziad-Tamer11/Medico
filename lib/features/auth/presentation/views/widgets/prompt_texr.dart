import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class PromptText extends StatelessWidget {
  const PromptText({
    super.key,
    required this.text1,
    required this.text2,
    this.onTap,
  });

  final String text1;
  final String text2;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: text1,
            style: TextStyle(
              color: const Color(0xFF7D8994),
              fontSize: 14,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w400,
              height: 1.40,
            ),
          ),
          TextSpan(
            text: text2,
            recognizer: TapGestureRecognizer()..onTap = onTap,
            style: TextStyle(
              color: const Color(0xFF32384B),
              fontSize: 14,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
              height: 1.40,
            ),
          ),
        ],
      ),
    );
  }
}

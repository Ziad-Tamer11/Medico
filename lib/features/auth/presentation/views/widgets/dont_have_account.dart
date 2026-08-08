import 'package:flutter/material.dart';

class PromptText extends StatelessWidget {
  const PromptText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: "Don't have an account?",
            style: TextStyle(
              color: const Color(0xFF7D8994),
              fontSize: 14,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w400,
              height: 1.40,
            ),
          ),
          TextSpan(
            text: ' Create Account',
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

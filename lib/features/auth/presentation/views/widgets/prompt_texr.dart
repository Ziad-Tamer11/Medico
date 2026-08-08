import 'package:flutter/material.dart';

class PromptText extends StatelessWidget {
  const PromptText({super.key, required this.text1, required this.text2});

  final String text1;
  final String text2;

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

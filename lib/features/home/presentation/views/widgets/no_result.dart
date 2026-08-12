import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class NoResult extends StatelessWidget {
  const NoResult({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Lottie.asset(Assets.imagesLottieNoResult),
        Text(text, style: TextStyles.font16SemiBold),
      ],
    );
  }
}

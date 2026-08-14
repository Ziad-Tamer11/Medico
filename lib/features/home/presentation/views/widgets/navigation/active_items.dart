import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(image, height: 24),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyles.font12SemiBold.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}

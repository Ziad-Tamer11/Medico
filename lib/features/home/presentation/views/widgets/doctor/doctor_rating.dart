import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class DoctorRating extends StatelessWidget {
  const DoctorRating({super.key, this.textStyle});
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('4.8', style: textStyle ?? TextStyles.font14Medium),
        const SizedBox(width: 4),
        SvgPicture.asset(Assets.imagesStar),
      ],
    );
  }
}

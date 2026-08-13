import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';

class DateAndMonthCard extends StatelessWidget {
  const DateAndMonthCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.only(
            top: 16,
            left: 16,
            right: 8,
            bottom: 16,
          ),
          decoration: ShapeDecoration(
            color: AppColor.datePickerBorder,
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: AppColor.blueGrey),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            spacing: 8,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.25,
                child: Text('Day', style: TextStyles.font14Regular),
              ),
              SvgPicture.asset(Assets.imagesShowMore),
            ],
          ),
        ),
      ],
    );
  }
}

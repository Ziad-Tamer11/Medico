import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/core/utils/app_images.dart';

class DoctorDetailsViewBody extends StatelessWidget {
  const DoctorDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 114,
          right: 0,
          left: 0,
          child: SvgPicture.asset(Assets.imagesHeartBeat),
        ),
        Positioned(
          top: 45,
          right: 60,
          left: 60,
          child: Image.asset(Assets.imagesDoctorImage),
        ),
      ],
    );
  }
}

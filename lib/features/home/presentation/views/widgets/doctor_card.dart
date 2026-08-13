import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/features/home/presentation/views/widgets/book_appointment_button.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_availability.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_info.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_rating.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      padding: EdgeInsets.all(16),
      decoration: ShapeDecoration(
        color: AppColor.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: AppColor.blueGrey),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(Assets.imagesDoctorProfile),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DoctorInfo(),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        DoctorRating(),
                        const SizedBox(width: 24),
                        DoctorAvailability(),
                      ],
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(Assets.imagesFavorite, color: AppColor.red),
            ],
          ),
          SizedBox(height: 16),
          BookAppointmentButton(
            onTap: () {
              context.push(AppRoute.kDoctorDetailsView);
            },
          ),
        ],
      ),
    );
  }
}

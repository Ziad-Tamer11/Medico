import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/utils/app_route.dart';
import 'package:medico/core/widgets/doctor_image.dart';
import 'package:medico/core/widgets/favorite_button_bloc_builder.dart';
import 'package:medico/features/home/domain/entities/doctor_entity.dart';
import 'package:medico/features/home/presentation/views/widgets/book_appointment_button.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor/doctor_info.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor/doctor_rating.dart';

class DoctorCard extends StatelessWidget {
  const DoctorCard({super.key, required this.doctorEntity});
  final DoctorEntity doctorEntity;

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
              DoctorImage(imageUrl: doctorEntity.image),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DoctorInfo(doctorEntity: doctorEntity),
                    const SizedBox(height: 8),
                    DoctorRating(doctorEntity: doctorEntity),
                  ],
                ),
              ),
              FavoriteButtonBlocBuilder(doctorId: doctorEntity.id),
            ],
          ),
          SizedBox(height: 16),
          BookAppointmentButton(
            onTap: () {
              context.push(AppRoute.kDoctorDetailsView, extra: doctorEntity);
            },
          ),
        ],
      ),
    );
  }
}

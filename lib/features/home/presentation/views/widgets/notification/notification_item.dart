import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medico/core/helpers/format_time_ago.dart';
import 'package:medico/core/utils/app_images.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/home/domain/entities/appointment_entity.dart';

class NotificationItem extends StatelessWidget {
  const NotificationItem({super.key, required this.appointment});

  final AppointmentEntity appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 24, right: 24, top: 24),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(Assets.imagesLogo, width: 48, height: 48),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Appointment with Dr ${appointment.doctorName}',
                  style: TextStyles.font16Bold,
                ),
                SizedBox(height: 4),
                Text('Confirmed Appointment', style: TextStyles.font14Medium),
              ],
            ),
          ),
          SizedBox(width: 16),
          Text(formatTimeAgo(appointment.createdAt), style: TextStyles.font14Regular),
        ],
      ),
    );
  }
}

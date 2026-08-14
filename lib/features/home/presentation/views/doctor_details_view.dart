import 'package:flutter/material.dart';
import 'package:medico/core/utils/app_colors.dart';
import 'package:medico/core/widgets/doctor_info_app_bar.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/doctor_info_bottom_sheet.dart';
import 'package:medico/features/home/presentation/views/widgets/doctor_details/doctors_info_view_body.dart';

class DoctorDetailsView extends StatelessWidget {
  const DoctorDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primary,
      appBar: doctorInfoAppBar(context),
      body: DoctorDetailsViewBody(),
      bottomSheet: DoctorInfoBottomSheet(),
    );
  }
}

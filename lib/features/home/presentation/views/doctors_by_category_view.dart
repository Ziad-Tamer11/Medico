import 'package:flutter/material.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';
import 'package:medico/features/home/presentation/views/widgets/doctors_by_category_view_body.dart';

class DoctorsByCategoryView extends StatelessWidget {
  const DoctorsByCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: 'Heart'),
      body: DoctorsByCategoryViewBody(),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';

class AllDoctorsView extends StatelessWidget {
  const AllDoctorsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: buildCustomAppBar(context, title: 'All Doctors'));
  }
}

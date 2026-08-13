import 'package:flutter/material.dart';
import 'package:medico/core/widgets/build_custom_app_bar.dart';
import 'package:medico/features/profile/presentation/views/widgets/edit_profile_view_body.dart';

class EditProfileView extends StatelessWidget {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(context, title: 'Account Information'),
      body: EditProfileViewBody(),
    );
  }
}

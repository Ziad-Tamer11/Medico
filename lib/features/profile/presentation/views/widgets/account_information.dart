import 'package:flutter/material.dart';
import 'package:medico/constants.dart';
import 'package:medico/core/utils/app_text_styles.dart';
import 'package:medico/features/profile/presentation/views/widgets/account_information_details.dart';

class AccountInformation extends StatelessWidget {
  const AccountInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kHorizontalPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Account Information', style: TextStyles.font16Bold),
          SizedBox(height: 24),
          AccountInformationDetails(),
        ],
      ),
    );
  }
}
